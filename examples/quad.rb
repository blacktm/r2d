require 'r2d'

window = R2D::Window.new

q1 = R2D::Quad.new(50, 50, 350, 50, 350, 250, 50, 250, "blue")
q2 = R2D::Quad.new(10, 10, 40, 100, 300, 150, 400, 50, "green")

window.add([q1, q2])

window.show
