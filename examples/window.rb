require 'r2d'

# Window with default options
window = R2D::Window.new
window.show

window = R2D::Window.new(
  title: "hello world",
  width: 500,
  height: 200
)
window.show

window = R2D::Window.new(
  title: "Another window!",
  width: 800,
  height: 600
)
window.show
