require 'r2d'

window = R2D::Window.new

s1 = R2D::Square.new(0, 0, 100, "green")
s2 = R2D::Square.new(100, 100, 100, [30, 100, 200, 255])

window.add([s1, s2])

window.show
