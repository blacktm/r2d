require 'r2d'

window = R2D::Window.new

q = R2D::Quad.new(10, 10, 40, 100, 300, 150, 400, 50, "green")

window.add(q)

window.show
