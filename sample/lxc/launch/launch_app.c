#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <shadow.h>
#include <pwd.h>
#include <grp.h>
#include <stdlib.h>
#include <sys/prctl.h>

#include <errno.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/ioctl.h>

#include <fcntl.h>
#include <unistd.h>
#include "capability.h"

#include "hi_type.h"
#include "hi_common.h"

#ifdef HI_ADVCA_FUNCTION_RELEASE
#define sample_printf(pszFormat...)
#else
#define sample_printf printf
#endif

int logfd = -1;

void show_groups()
{
	int n, i;
	const int gidsetsize = 1024;
	unsigned int grouplist[gidsetsize];

	/* 获取附加组ID */
	memset(grouplist, 0x0, sizeof(grouplist));
	n = getgroups(gidsetsize, grouplist);

	sample_printf("grouplist:");
	for (i = 0; n > 0 && i < n; i++) {
		sample_printf(" %ul ", grouplist[i]);
	}
	sample_printf("\n");
	return;
}

void show_ids()
{
	sample_printf("uid = %d, euid = %d, gid = %d, egid = %d\n", getuid(), geteuid(), getgid(), getegid());
	return;
}

static int parse_uid_gid(char *pstr, uid_t * puid, gid_t * pgid)
{
	char *p = NULL;
	uid_t uid;
	gid_t gid;
	char strBuf[50];

	memset(strBuf, 0x0, sizeof(strBuf));
	strncpy(strBuf, pstr, sizeof(strBuf));

	p = strchr(pstr, ':');
	if (p == NULL) {
		sample_printf("uid:gid parameter error 1 \n");
		return -1;
	}

	*p = '\0';

	uid = strtoul(strBuf, NULL, 0);

	p = p + 1;
	if (p == NULL) {
		sample_printf("uid:gid parameter error 2\n");
		return -1;
	}
	gid = strtoul(p, NULL, 0);

	*puid = uid;
	*pgid = gid;

	sample_printf("uid=%d  gid=%d\n", uid, gid);
	return 0;
}

static int drop_priviledges(uid_t uid, gid_t gid)
{
	int ret;

	ret = setgid(gid);
	if (0 != ret) {
		sample_printf("Fail to set gid, ret=%d\n", ret);
		return -1;
	}
	/*setresuid */
	ret = initgroups("stb", 1000);
	if (0 != ret) {
		sample_printf("Fail to set supplementary groups, ret=%d\n", ret);
	}

	ret = setuid(uid);
	if (0 != ret) {
		sample_printf("Fail to set uid, ret=%d\n", ret);
		return -1;
	}

	return 0;
}

static int create_argv(int argc, char *argv[], char **pxargv[])
{
	char *p;
	char **xargv = NULL, **args = NULL;
	int argno = 0, args_cnt = 0;

	/*If executive app has extral parameters, e.g. /home/dvbplay 618, make argv vector for app execution */
	if (argc > 3) {
		args_cnt = (argc - 2) + 1;
		xargv = malloc(sizeof(char *) * args_cnt);
		if (xargv == NULL) {
			sample_printf("Fail to malloc memory for argv\n");
			return -1;
		}

		p = strrchr(argv[2], '/');
		xargv[0] = ++p;

		args = &argv[2];	/*skip first two parameters e.g. launch_app  1000:1000 */

		for (argno = 0; argno < args_cnt - 1; argno++) {
			if (argno == 0) {
				p = strrchr(*args, '/');
				xargv[argno] = ++p;
			} else {
				xargv[argno] = *args;
			}
			args++;
		}

		xargv[argno] = NULL;
	}

	sample_printf("=====================================\n");
	sample_printf("App run commands: %s", argv[2]);
	for (argno = 0; argno < args_cnt - 1; argno++) {
		sample_printf(" %s", xargv[argno]);
	}
	sample_printf("\n");

	if (pxargv != NULL) {
		*pxargv = xargv;
	}

	return 0;
}

static void usage()
{
	sample_printf("Usage: launch_app [uid:gid] [app path] [para] ...\n");
	sample_printf("Example: launch_app  1000:1000 /home/dvbplay 618\n");
	return;
}

void open_log(void)
{
	char *file = getenv("LOGDEV");

	if (!file || !strncmp(file, "none", 4)) {
		sample_printf("No app log\n");
		return;
	}

	logfd = open(file, O_WRONLY | O_CREAT | O_APPEND);

	if (logfd < 0) {
		sample_printf("Warning: open %s, failed! errinfo=%s\n", file, strerror(errno));
		return;
	}

	if (dup2(logfd, STDOUT_FILENO) < 0)
		sample_printf("Warning: dup stdout to %s, failed! errinfo=%s\n", file, strerror(errno));

	if (dup2(logfd, STDERR_FILENO) < 0)
		sample_printf("Warning: dup stderr to %s, failed! errinfo=%s\n", file, strerror(errno));
}

void close_log(void)
{
	if (logfd >= 0)
		close(logfd);
}

int main(int argc, char *argv[])
{
	int ret = -1;
	uid_t uid;
	gid_t gid;
	char *pathName;
	char **xargv = NULL;
	cap_t caps = NULL;
	cap_value_t cap;

	if (argc < 3) {
		usage();
		return -1;
	}

	open_log();

	if (geteuid() != 0) {
		sample_printf("It is not root user id\n");
		goto out;
	}

	sample_printf("=====================================\n");
	sample_printf("uid and group id infor before drop:\n");
	show_ids();
	show_groups();

	ret = parse_uid_gid(argv[1], &uid, &gid);
	if (0 != ret) {
		sample_printf("Fail to get uid and gid\n");
		goto out;
	}

	/**************set capabilities for current progress*************/
	/* get the capabilities of current process */
	caps = cap_get_proc();	/*caps = cap_init(); */
	sample_printf("current process capabilities: %s\n", cap_to_text(caps, NULL));

	for (cap = 0; cap <= CAP_LAST_CAP; cap++) {
		cap_flag_value_t flag;

		ret = cap_get_flag(caps, cap, CAP_PERMITTED, &flag);
		if (ret) {
			if (errno == EINVAL) {
				sample_printf("Last supported cap was %d \n", cap - 1);
				break;
			} else {
				sample_printf("failed to call cap_get_flag at %d\n", cap);
				goto out;
			}
		}

		ret = cap_set_flag(caps, CAP_EFFECTIVE, 1, &cap, flag);
		if (ret) {
			sample_printf("failed to call cap_set_flag at %d\n", cap);
			goto out;
		}

		ret = cap_set_flag(caps, CAP_INHERITABLE, 1, &cap, flag);
		if (ret) {
			sample_printf("failed to call cap_set_flag at %d\n", cap);
			goto out;
		}
	}

	ret = prctl(PR_SET_KEEPCAPS, 1);
	if (0 != ret) {
		sample_printf("Fail to call prctl\n");
		goto out;
	}

	ret = drop_priviledges(uid, gid);
	if (0 != ret) {
		sample_printf("Fail to get uid and gid\n");
		goto out;
	}

	if (0 != cap_set_proc(caps)) {
		sample_printf("Cannot set process capabilities \n");
		goto out;
	}

	cap_free(caps);

	sample_printf("=====================================\n");
	sample_printf("uid and group id infor after drop:\n");
	show_ids();
	show_groups();

#ifndef HI_ADVCA_FUNCTION_RELEASE
	/* Show the capabilities of current process after drop privilege */
	caps = cap_get_proc();
	sample_printf("new capabilities: %s\n", cap_to_text(caps, NULL));
	cap_free(caps);
#endif

	/**************Prepare parameter for execute applicaiton*************/
	pathName = argv[2];
	ret = access(pathName, X_OK);	/*Judge if the app exist or executive privilege exist */
	if (0 != ret) {
		sample_printf("File not exist or not privilege access: ret = %d\n", ret);
		goto out;
	}

	ret = create_argv(argc, argv, &xargv);
	if (0 != ret) {
		sample_printf("Fail to create argv for running app \n");
		goto out;
	}

	/***************************execute app***************************************/
	/*char *argv_test[] = {"ipc_server_test","618",NULL}; */
	ret = execv(pathName, (char **)xargv);
	/*ret = execl("/home/ipc_server_test", "ipc_server_test", "618", (char *) 0); */
	sample_printf("Launch failed ret=%d \n", ret);

      out:
	if (xargv != NULL) {
		free(xargv);
	}
	if (caps)
		cap_free(caps);

	close_log();

	return ret;
}
