#include <ruby.h>
#include "glfw/glfw3.h"

static VALUE r2d_module = Qundef;
static VALUE r2d_window_klass = Qundef;


/*
 * GLFW error callback
 */
static void error_callback(int error, const char* description) {
  fputs(description, stderr);
}


/*
 * Draw OpenGL triangle
 */
static VALUE r2d_draw_triangle(VALUE self,
                               VALUE x1, VALUE y1, VALUE c1,
                               VALUE x2, VALUE y2, VALUE c2,
                               VALUE x3, VALUE y3, VALUE c3) {
  
  // printf("%s\n", "r2d_draw_triangle()");
  
  double c1r = NUM2DBL(rb_iv_get(c1, "@r"));
  double c1g = NUM2DBL(rb_iv_get(c1, "@g"));
  double c1b = NUM2DBL(rb_iv_get(c1, "@b"));
  double c1a = NUM2DBL(rb_iv_get(c1, "@a"));
  
  double c2r = NUM2DBL(rb_iv_get(c2, "@r"));
  double c2g = NUM2DBL(rb_iv_get(c2, "@g"));
  double c2b = NUM2DBL(rb_iv_get(c2, "@b"));
  double c2a = NUM2DBL(rb_iv_get(c2, "@a"));
  
  double c3r = NUM2DBL(rb_iv_get(c3, "@r"));
  double c3g = NUM2DBL(rb_iv_get(c3, "@g"));
  double c3b = NUM2DBL(rb_iv_get(c3, "@b"));
  double c3a = NUM2DBL(rb_iv_get(c3, "@a"));
  
  glBegin(GL_TRIANGLES);
  
  glColor4f(c1r, c1g, c1b, c1a);
  glVertex2f(NUM2DBL(x1), NUM2DBL(y1));
  
  glColor4f(c2r, c2g, c2b, c2a);
  glVertex2f(NUM2DBL(x2), NUM2DBL(y2));
  
  glColor4f(c3r, c3g, c3b, c3a);
  glVertex2f(NUM2DBL(x3), NUM2DBL(y3));
  
  glEnd();
  
  return self;
}


/*
 * R2D::Window#show
 */
static VALUE r2d_show(VALUE self) {
  
  VALUE win_width = rb_iv_get(self, "@w");
  VALUE win_height = rb_iv_get(self, "@h");
  
  GLFWwindow* window;
  
  glfwSetErrorCallback(error_callback);
  
  if (!glfwInit())
    exit(EXIT_FAILURE);
  
  window = glfwCreateWindow(NUM2INT(win_width), NUM2INT(win_height), "R2D", NULL, NULL);
  if (!window) {
    glfwTerminate();
    exit(EXIT_FAILURE);
  }
  
  glfwMakeContextCurrent(window);
  
  while (!glfwWindowShouldClose(window)) {
    
    int width, height;
    
    glfwGetWindowSize(window, &width, &height);
    
    glViewport(0, 0, width, height);
    glClear(GL_COLOR_BUFFER_BIT);
    
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0, width, height, 0, -1.0f, 1.0f);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    
    // Enable transparency
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    // Call `window.draw`
    rb_funcall(self, rb_intern("draw"), 0);
    
    glfwSwapBuffers(window);
    glfwPollEvents();
  }
  
  glfwDestroyWindow(window);
  
  glfwTerminate();
  exit(EXIT_SUCCESS);
}


void Init_r2d(void) {
  
  /* R2D module */
  r2d_module = rb_define_module("R2D");
  
  /* R2D::Window */
  r2d_window_klass = rb_define_class_under(r2d_module, "Window", rb_cObject);
  
  rb_define_method(r2d_window_klass, "show", r2d_show, 0);
  rb_define_method(r2d_window_klass, "draw_triangle", r2d_draw_triangle, 9);
}
