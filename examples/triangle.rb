require 'r2d'

window = R2D::Window.new

t1 = R2D::Triangle.new(0, 0, 100, 100, 0, 200, "blue")
t2 = R2D::Triangle.new(500, 500, 200, 500, 300, 300, [255, 255, 0, 255])
t3 = R2D::Triangle.new(0, 0, 300, 300, 300, 500, [0, 1.0, 0, 0.5])

window.add([t1, t2, t3])

window.show
