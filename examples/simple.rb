require 'r2d'

window = R2D::Window.new

r = R2D::Rectangle.new(0, 0, 100, 100, "blue")

window.add(r)

window.show
