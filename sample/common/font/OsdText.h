
//https://codeload.github.com/julienr/libfont/zip/master
#include "Font.h"
#include "FTLib.h"
#include "FontHelper.h"

#define GLERR do {int err=glGetError();if (err != 0) LOGE("GL Error at %s:%i : %i", __FILE__, __LINE__, err); } while(0)

#define SCALE_MIN 50
#define SCALE_MAX 100

namespace android {
class OSDText {
  public:
    OSDText(){
      helloState.rot = 180;
      helloState.rotIncr = 30;
      helloState.scale = 70;
      helloState.scaleIncr = 10;
    }
    int width;
    int height;

//  protected:
    int getWidth()  const {return width;}
    int getHeight() const {return height;}

    void postInit (const char* font_path, int w, int h) {
      srand(time(NULL));

      width=w; height=h;
      _loadFont(font_path);
      GLERR;

      glMatrixMode(GL_PROJECTION);
      glLoadIdentity();
      //  glClearColor(0.7f,0.7f,0.7f,0.0f);
      glClearColor(0.3,0.3,0.3,1);
      glOrthof(0, getWidth(), getHeight(), 0, -1, 1);

      glMatrixMode(GL_MODELVIEW);
      glLoadIdentity();
      glDisable(GL_DEPTH_TEST);
      glDisable(GL_CULL_FACE);
      glColor4f(1,1,1,1);//color
      glEnable(GL_TEXTURE_2D);

      glEnable(GL_BLEND);
      glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

      glEnableClientState(GL_VERTEX_ARRAY);
      glEnableClientState(GL_TEXTURE_COORD_ARRAY);


//      Circle::create(10);
      GLERR;
    }

    void drawImpl () {
      glClear(GL_COLOR_BUFFER_BIT);
      glColor4f(1,1,1,1);

      glLoadIdentity();

      drawText(font, "This is a rotating/scaling multiline hello world !", 0, 25, 25);

//      fontlib::FontHelper::drawCenteredAt(font, "hello\nworld !", helloState.scale, getWidth()/2, getHeight()/2, false, helloState.rot);
      FontHelper::drawCenteredAt(font, "hello\nworld !", helloState.scale, getWidth()/2, getHeight()/2, false, helloState.rot);

      /*glDisable(GL_TEXTURE_2D);
      glPushMatrix();
      glColor4f(1,0,0,1);
      glTranslatef(getWidth()/2, getHeight()/2, 0);
      glScalef(5,5,1);
      Circle::draw(false);
      glPopMatrix();
      glEnable(GL_TEXTURE_2D);*/
    }

    void simulate (double elapsedS) {
//      LOGI("Simulate (%f), rot=%f, scale=%f", elapsedS, helloState.rot, helloState.scale);
      helloState.rot += helloState.rotIncr*elapsedS;
      if (helloState.rot > 360)
        helloState.rot -= 360;

      helloState.scale += helloState.scaleIncr*elapsedS;
      if (helloState.scale <= SCALE_MIN || helloState.scale >= SCALE_MAX)
        helloState.scaleIncr *= -1;
    }

//    void drawText (fontlib::Font* font, const char* msg, int x, int y, int size) {
    void drawText (Font* font, const char* msg, int x, int y, int size) {
      glPushMatrix();

      glTranslatef(x, y, 0);
      font->draw(msg, size, false);

      glPopMatrix();
    }

//  private:
    void _loadFont (const char* pPath) {

        FTLib *pLib = new FTLib();
        font = pLib->loadMemoryFont(pPath,  30);
        if (!font) {
            LOGE("Error loading font");
        }

    }

    struct {
      float rot;
      float rotIncr;
      float scale;
      float scaleIncr;
    } helloState;

//    fontlib::Font* font;
    Font* font;
};

}//namespace android
