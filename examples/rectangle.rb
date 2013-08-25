require 'r2d'

window = R2D::Window.new

r1 = R2D::Rectangle.new(0, 0, 150, 100, "blue")
r2 = R2D::Rectangle.new(100, 100, 150, 100, [30, 255, 200, 255])
r3 = R2D::Rectangle.new(200, 200, 150, 100, [0.8, 0.6, 0.4, 0.5])

# window.add([r1, r2, r3])
window.add(r1)
window.add(r2)
window.add(r3)

window.show
