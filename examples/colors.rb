require 'r2d'

window = R2D::Window.new(width: 500, height: 400)

window.add([
  R2D::Square.new(0,     0, 100, "black"),
  R2D::Square.new(100,   0, 100, "gray"),
  R2D::Square.new(200,   0, 100, "silver"),
  R2D::Square.new(300,   0, 100, "white"),
  R2D::Square.new(400,   0, 100, "navy"),
  R2D::Square.new(0,   100, 100, "blue"),
  R2D::Square.new(100, 100, 100, "aqua"),
  R2D::Square.new(200, 100, 100, "teal"),
  R2D::Square.new(300, 100, 100, "olive"),
  R2D::Square.new(400, 100, 100, "green"),
  R2D::Square.new(0,   200, 100, "lime"),
  R2D::Square.new(100, 200, 100, "yellow"),
  R2D::Square.new(200, 200, 100, "orange"),
  R2D::Square.new(300, 200, 100, "red"),
  R2D::Square.new(400, 200, 100, "maroon"),
  R2D::Square.new(0,   300, 100, "fuchsia"),
  R2D::Square.new(100, 300, 100, "purple"),
  R2D::Square.new(200, 300, 100, "brown"),
  R2D::Square.new(300, 300, 100, "random"),
  R2D::Square.new(400, 300, 100, "random")
])

window.show
