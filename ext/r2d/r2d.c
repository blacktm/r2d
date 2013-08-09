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
  glBegin(GL_TRIANGLES);
  
  printf("%s\n", "r2d_draw_triangle()");
  glColor3f(1.f, 0.f, 0.f);
  glVertex2f(NUM2DBL(x1), NUM2DBL(y1));
  
  glColor3f(0.f, 1.f, 0.f);
  glVertex2f(NUM2DBL(x2), NUM2DBL(y2));
  
  glColor3f(0.f, 0.f, 1.f);
  glVertex2f(NUM2DBL(x3), NUM2DBL(y3));
  
  glEnd();
  
  return self;
}


/*
 * Draw OpenGL quad
 */
static VALUE r2d_draw_quad(VALUE self,
                           VALUE x1, VALUE y1, VALUE c1,
                           VALUE x2, VALUE y2, VALUE c2,
                           VALUE x3, VALUE y3, VALUE c3,
                           VALUE x4, VALUE y4, VALUE c4) {
  glBegin(GL_TRIANGLES);
  
  glColor3f(1.f, 0.f, 0.f);
  glVertex3f(-1.0f, -0.4f, 0.f);
  
  glColor3f(0.f, 1.f, 0.f);
  glVertex3f(0.6f, -0.4f, 0.f);
  
  glColor3f(0.f, 0.f, 1.f);
  glVertex3f(0.f, 0.6f, 0.f);
  
  glEnd();
  
  return self;
}


/*
 * Starts the R2D demo
 */
static VALUE r2d_demo(VALUE self) {
  
  GLFWwindow* window;
  
  glfwSetErrorCallback(error_callback);
  
  if (!glfwInit())
    exit(EXIT_FAILURE);
  
  window = glfwCreateWindow(640, 480, "R2D", NULL, NULL);
  if (!window) {
    glfwTerminate();
    exit(EXIT_FAILURE);
  }
  
  glfwMakeContextCurrent(window);
  
  while (!glfwWindowShouldClose(window)) {
    
    float ratio;
    int width, height;
    
    glfwGetWindowSize(window, &width, &height);
    ratio = width / (float) height;
    
    glViewport(0, 0, width, height);
    glClear(GL_COLOR_BUFFER_BIT);
    
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(-ratio, ratio, -1.f, 1.f, 1.f, -1.f);
    glMatrixMode(GL_MODELVIEW);
    
    glLoadIdentity();
    glRotatef((float) glfwGetTime() * 20.f, 0.f, 0.f, 1.f);
    
    glBegin(GL_TRIANGLES);
    glColor3f(1.f, 0.f, 0.f);
    glVertex3f(-0.6f, -0.4f, 0.f);
    glColor3f(0.f, 1.f, 0.f);
    glVertex3f(0.6f, -0.4f, 0.f);
    glColor3f(0.f, 0.f, 1.f);
    glVertex3f(0.f, 0.6f, 0.f);
    glEnd();
    
    glfwSwapBuffers(window);
    glfwPollEvents();
  }
  
  glfwDestroyWindow(window);
  
  glfwTerminate();
  exit(EXIT_SUCCESS);
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
  
  rb_define_method(r2d_window_klass, "demo", r2d_demo, 0);
  rb_define_method(r2d_window_klass, "show", r2d_show, 0);
  rb_define_method(r2d_window_klass, "draw_triangle", r2d_draw_triangle, 9);
  rb_define_method(r2d_window_klass, "draw_quad", r2d_draw_quad, 12);
}







