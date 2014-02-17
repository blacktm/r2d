require 'r2d'

window = R2D::Window.new

img = R2D::Image.new(100, 100, "media/rainbow.png")

window.add(img)

window.show
