#include <ruby.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <SDL2/SDL_image.h>
#include <SDL2/SDL_mixer.h>
#include <SDL2/SDL_ttf.h>

#define TRIANGLE 1
#define QUAD     2
#define IMAGE    3
#define TEXT     4

static VALUE r2d_module;
static VALUE r2d_window_klass;
static VALUE c_data_klass;

struct img_data {
  SDL_Surface *surface;
  SDL_Texture *texture;
};

struct text_data {
  TTF_Font *font;
  SDL_Surface *surface;
  SDL_Texture *texture;
};


/*
 * Init window for OpenGL
 */
bool initGL(width, height) {
  GLenum error = GL_NO_ERROR;
  
  glViewport(0, 0, width, height);
  glOrtho(0, width, height, 0, -1.f, 1.f);
  
  // Initialize the projection matrix
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  
  // Initialize the modelview matrix
  glMatrixMode( GL_MODELVIEW );
  glLoadIdentity();
  
  // Enable transparency
  glEnable(GL_BLEND);
  glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
  
  // Check for errors
  error = glGetError();
  if (error != GL_NO_ERROR) {
    printf( "Error initializing OpenGL! Error code: %i\n", error);
    return false;
  } else {
    return true;
  }
}


/*
 * Draw an OpenGL triangle
 */
static void draw_triangle(double x1,  double y1,
                          double c1r, double c1g, double c1b, double c1a,
                          double x2,  double y2,
                          double c2r, double c2g, double c2b, double c2a,
                          double x3,  double y3,
                          double c3r, double c3g, double c3b, double c3a) {
  
  glEnable(GL_BLEND);
  glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
  
  glBegin(GL_TRIANGLES);
    
    glColor4f(c1r, c1g, c1b, c1a);
    glVertex2f(x1, y1);
    
    glColor4f(c2r, c2g, c2b, c2a);
    glVertex2f(x2, y2);
    
    glColor4f(c3r, c3g, c3b, c3a);
    glVertex2f(x3, y3);
    
  glEnd();
}


/*
 * Free the img data
 */
static void img_free(struct img_data *data) {
  SDL_DestroyTexture(data->texture);
  SDL_FreeSurface(data->surface);
}


/*
 * Free the text data
 */
static void text_free(struct text_data *data) {
  TTF_CloseFont(data->font);
  SDL_DestroyTexture(data->texture);
  SDL_FreeSurface(data->surface);
}


/*
 * Init the image data
 */
static VALUE init_image(SDL_Renderer *renderer, char *path) {
  struct img_data *data = ALLOC(struct img_data);
  
  data->surface = IMG_Load(path);
  data->texture = SDL_CreateTextureFromSurface(renderer, data->surface);
  
  return Data_Wrap_Struct(c_data_klass, NULL, img_free, data);
}


/*
 * Draw an image in OpenGL
 */
static void draw_image(VALUE el, int x, int y) {
  
  struct img_data *data;
  Data_Get_Struct(rb_iv_get(el, "@data"), struct img_data, data);
  
  glEnable(GL_BLEND);
  glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
  
  SDL_GL_BindTexture(data->texture, NULL, NULL);
  
  int w = data->surface->w;
  int h = data->surface->h;
  
  glBegin(GL_QUADS);
    
    glColor4f(1, 1, 1, 1);
    
    glTexCoord2f(0, 0);
    glVertex2f(x, y);
    
    glTexCoord2f(w, 0);
    glVertex2f(x + w, y);
    
    glTexCoord2f(w, h);
    glVertex2f(x + w, y + h);
    
    glTexCoord2f(0, h);
    glVertex2f(x, y + h);
    
  glEnd();
  
  SDL_GL_UnbindTexture(data->texture);
}


/*
 * Init the text data
 */
static VALUE init_text(SDL_Renderer *renderer,
                       char *path, char *text, int size) {
  
  struct text_data *data = ALLOC(struct text_data);
  
  SDL_Color color = { 255, 255, 255 };
  
  data->font = TTF_OpenFont(path, size);
  data->surface = TTF_RenderText_Blended(data->font, text, color);
  data->texture = SDL_CreateTextureFromSurface(renderer, data->surface);
  
  return Data_Wrap_Struct(c_data_klass, NULL, text_free, data);
}


/*
 * Draw text with SDL2_ttf in OpenGL
 */
static void draw_text(VALUE el, char *text, int x, int y) {
  
  struct text_data *data;
  Data_Get_Struct(rb_iv_get(el, "@data"), struct text_data, data);
  
  int w, h;
  TTF_SizeText(data->font, text, &w, &h);
  
  glEnable(GL_BLEND);
  glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
  
  SDL_GL_BindTexture(data->texture, NULL, NULL);
  
  glBegin(GL_QUADS);
    glColor4f(1, 1, 1, 1);
    glTexCoord2f(0, 0); glVertex2f(x, y);
    glTexCoord2f(w, 0); glVertex2f(x + w, y);
    glTexCoord2f(w, h); glVertex2f(x + w, y + h);
    glTexCoord2f(0, h); glVertex2f(x, y + h);
  glEnd();
  
  SDL_GL_UnbindTexture(data->texture);
}


/*
 * R2D::Window#show
 */
static VALUE r2d_show(VALUE self) {
  
  // Get the window width and height from the Ruby window instance
  int win_width = NUM2INT(rb_iv_get(self, "@width"));
  int win_height = NUM2INT(rb_iv_get(self, "@height"));
  char* win_title = RSTRING_PTR(rb_iv_get(self, "@title"));
  int fps_cap = NUM2INT(rb_iv_get(self, "@fps_cap"));
  
  // SDL Inits /////////////////////////////////////////////////////////////////
  // May need more inits: http://wiki.libsdl.org/SDL_Init
  
  SDL_Init(SDL_INIT_VIDEO);
  TTF_Init();
  
  // Creating SDL window ///////////////////////////////////////////////////////
  
  SDL_Window *window = SDL_CreateWindow(
    win_title,                                       // title
    SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,  // window position
    win_width, win_height,                           // window size
    SDL_WINDOW_OPENGL                                // flags
  );
  
  // Check if windows was successfully created
  if (window == NULL) {
    printf("Could not create window: %s\n", SDL_GetError());
    return 1;
  }
    
  // OpenGL Inits //////////////////////////////////////////////////////////////
  
  SDL_GLContext glcontext = SDL_GL_CreateContext(window);
  initGL(win_width, win_height);
  
  // Create SDL Renderer for Accelerated 2D ////////////////////////////////////
  
  SDL_Renderer *renderer = SDL_CreateRenderer(
    window, -1, SDL_RENDERER_ACCELERATED
  );
  
  // Setting up variables
  int cursor_x, cursor_y;  // Cursor positions
  Uint32 frames = 0;       // Total frames since start
  Uint32 start_ms = SDL_GetTicks();  // Elapsed time since start
  Uint32 begin_ms = start_ms;  // TIme at beginning of loop
  Uint32 end_ms;    // Time at end of loop
  Uint32 total_ms;  // Total elapsed time
  Uint32 loop_ms;   // Elapsed time of loop
  int delay_ms;     // Amount of delay to achieve desired frame rate
  double fps;       // The actual frame rate
  
  // Main Event Loop ///////////////////////////////////////////////////////////
  
  bool quit = false;
  while (!quit) {
    
    // Set FPS /////////////////////////////////////////////////////////////////
    
    frames++;
    end_ms = SDL_GetTicks();
    
    total_ms = end_ms - start_ms;
    fps = frames / (total_ms / 1000.0);
    
    loop_ms = end_ms - begin_ms;
    delay_ms = (1000 / fps_cap) - loop_ms;
    
    if (delay_ms < 0) { delay_ms = 0; }
    
    // loop_ms + delay_ms => should equal => (1000 / fps_cap)
    
    // Store FPS info
    rb_iv_set(self, "@frames", INT2NUM(frames));
    rb_iv_set(self, "@total_ms", INT2NUM(total_ms));
    rb_iv_set(self, "@loop_ms", INT2NUM(loop_ms));
    rb_iv_set(self, "@fps", DBL2NUM(fps));
    
    SDL_Delay(delay_ms);
    begin_ms = SDL_GetTicks();
    
    // Input Handling //////////////////////////////////////////////////////////
    
    SDL_Event e;
    while (SDL_PollEvent(&e)) {
      
      switch(e.type) {
        case SDL_KEYDOWN:
          rb_funcall(self, rb_intern("key_callback"), 1,
            rb_str_new2(SDL_GetScancodeName(e.key.keysym.scancode)));
          break;
        case SDL_QUIT:
          quit = true;
          break;
      }
      
    }
    
    // Store the cursor position
    SDL_GetMouseState(&cursor_x, &cursor_y);
    rb_iv_set(self, "@cursor_x", INT2NUM(cursor_x));
    rb_iv_set(self, "@cursor_y", INT2NUM(cursor_y));
    
    // Update Application State ////////////////////////////////////////////////
    
    // Call update proc, `window.update`
    rb_funcall(self, rb_intern("update_callback"), 0);
    
    // Draw Objects ////////////////////////////////////////////////////////////
    
    glClear(GL_COLOR_BUFFER_BIT);
    
    // Read window objects
    VALUE objects = rb_iv_get(self, "@objects");
    int num_objects = NUM2INT(rb_funcall(objects, rb_intern("count"), 0));
    
    // Switch on each object type
    for (int i = 0; i < num_objects; ++i) {
      
      VALUE el = rb_ary_entry(objects, i);
      int type_id = NUM2INT(rb_iv_get(el, "@type_id"));
      
      // Switch on the object's type_id
      switch(type_id) {
        
        case TRIANGLE: {
          VALUE c1 = rb_iv_get(el, "@c1");
          VALUE c2 = rb_iv_get(el, "@c2");
          VALUE c3 = rb_iv_get(el, "@c3");
          
          draw_triangle(
            NUM2DBL(rb_iv_get(el, "@x1")),
            NUM2DBL(rb_iv_get(el, "@y1")),
            NUM2DBL(rb_iv_get(c1, "@r")),
            NUM2DBL(rb_iv_get(c1, "@g")),
            NUM2DBL(rb_iv_get(c1, "@b")),
            NUM2DBL(rb_iv_get(c1, "@a")),
            
            NUM2DBL(rb_iv_get(el, "@x2")),
            NUM2DBL(rb_iv_get(el, "@y2")),
            NUM2DBL(rb_iv_get(c2, "@r")),
            NUM2DBL(rb_iv_get(c2, "@g")),
            NUM2DBL(rb_iv_get(c2, "@b")),
            NUM2DBL(rb_iv_get(c2, "@a")),
            
            NUM2DBL(rb_iv_get(el, "@x3")),
            NUM2DBL(rb_iv_get(el, "@y3")),
            NUM2DBL(rb_iv_get(c3, "@r")),
            NUM2DBL(rb_iv_get(c3, "@g")),
            NUM2DBL(rb_iv_get(c3, "@b")),
            NUM2DBL(rb_iv_get(c3, "@a"))
          );
        }
        break;
        
        case QUAD: {
          VALUE c1 = rb_iv_get(el, "@c1");
          VALUE c2 = rb_iv_get(el, "@c2");
          VALUE c3 = rb_iv_get(el, "@c3");
          VALUE c4 = rb_iv_get(el, "@c4");
          
          draw_triangle(
            NUM2DBL(rb_iv_get(el, "@x1")),
            NUM2DBL(rb_iv_get(el, "@y1")),
            NUM2DBL(rb_iv_get(c1, "@r")),
            NUM2DBL(rb_iv_get(c1, "@g")),
            NUM2DBL(rb_iv_get(c1, "@b")),
            NUM2DBL(rb_iv_get(c1, "@a")),
            
            NUM2DBL(rb_iv_get(el, "@x2")),
            NUM2DBL(rb_iv_get(el, "@y2")),
            NUM2DBL(rb_iv_get(c2, "@r")),
            NUM2DBL(rb_iv_get(c2, "@g")),
            NUM2DBL(rb_iv_get(c2, "@b")),
            NUM2DBL(rb_iv_get(c2, "@a")),
            
            NUM2DBL(rb_iv_get(el, "@x3")),
            NUM2DBL(rb_iv_get(el, "@y3")),
            NUM2DBL(rb_iv_get(c3, "@r")),
            NUM2DBL(rb_iv_get(c3, "@g")),
            NUM2DBL(rb_iv_get(c3, "@b")),
            NUM2DBL(rb_iv_get(c3, "@a"))
          );
          
          draw_triangle(
            NUM2DBL(rb_iv_get(el, "@x3")),
            NUM2DBL(rb_iv_get(el, "@y3")),
            NUM2DBL(rb_iv_get(c3, "@r")),
            NUM2DBL(rb_iv_get(c3, "@g")),
            NUM2DBL(rb_iv_get(c3, "@b")),
            NUM2DBL(rb_iv_get(c3, "@a")),
            
            NUM2DBL(rb_iv_get(el, "@x4")),
            NUM2DBL(rb_iv_get(el, "@y4")),
            NUM2DBL(rb_iv_get(c4, "@r")),
            NUM2DBL(rb_iv_get(c4, "@g")),
            NUM2DBL(rb_iv_get(c4, "@b")),
            NUM2DBL(rb_iv_get(c4, "@a")),
            
            NUM2DBL(rb_iv_get(el, "@x1")),
            NUM2DBL(rb_iv_get(el, "@y1")),
            NUM2DBL(rb_iv_get(c1, "@r")),
            NUM2DBL(rb_iv_get(c1, "@g")),
            NUM2DBL(rb_iv_get(c1, "@b")),
            NUM2DBL(rb_iv_get(c1, "@a"))
          );
        }
        break;
        
        case IMAGE: {
          if (rb_iv_get(el, "@data") == Qnil) {
            VALUE data = init_image(
              renderer,
              RSTRING_PTR(rb_iv_get(el, "@path"))
            );
            rb_iv_set(el, "@data", data);
          }
          
          draw_image(
            el,
            NUM2DBL(rb_iv_get(el, "@x")),
            NUM2DBL(rb_iv_get(el, "@y"))
          );
        }
        break;
        
        case TEXT: {
          if (rb_iv_get(el, "@data") == Qnil) {
            VALUE data = init_text(
              renderer,
              RSTRING_PTR(rb_iv_get(el, "@font")),
              RSTRING_PTR(rb_iv_get(el, "@text")),
              NUM2DBL(rb_iv_get(el, "@size"))
            );
            rb_iv_set(el, "@data", data);
          }
          
          // TODO: Set color of text
          // VALUE c = rb_iv_get(el, "@c");
          // NUM2DBL(rb_iv_get(c, "@r")),
          // NUM2DBL(rb_iv_get(c, "@g")),
          // NUM2DBL(rb_iv_get(c, "@b")),
          
          draw_text(
            el,
            RSTRING_PTR(rb_iv_get(el, "@text")),
            NUM2DBL(rb_iv_get(el, "@x")),
            NUM2DBL(rb_iv_get(el, "@y"))
          );
        }
        break;
      }
    }
    
    // Draw frame
    SDL_GL_SwapWindow(window);
  }
  
  // Clean up
  SDL_GL_DeleteContext(glcontext);
  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);
  SDL_Quit();
  
  return 0;
}


/*
 * Ruby C extension init
 */
void Init_r2d() {
  
  // R2D
  r2d_module = rb_define_module("R2D");
  
  // R2D::Window
  r2d_window_klass = rb_define_class_under(r2d_module, "Window", rb_cObject);
  
  // R2D::Window#show
  rb_define_method(r2d_window_klass, "show", r2d_show, 0);
  
  // R2D::CData
  c_data_klass = rb_define_class_under(r2d_module, "CData", rb_cObject);
}
