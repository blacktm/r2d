require 'r2d'

window = R2D::Window.new

s1 = R2D::Square.new(10, 10, 100)
s2 = R2D::Square.new(10, 120, 100)

window.add([s1, s2])

s1.gradient = {
  top: "red",
  bottom: "blue"
}

window.show
