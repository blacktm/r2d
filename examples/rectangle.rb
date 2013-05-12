require 'r2d'

window width: 640, height: 480

r1 = Rectangle.new(0, 0, 150, 100, "blue")
r2 = Rectangle.new(100, 100, 150, 100, [30, 255, 200, 255])
r3 = Rectangle.new(200, 200, 150, 100, [0.8, 0.6, 0.4, 0.5])

window :show
