require 'r2d'

window = R2D::Window.new

t = R2D::Text.new(10, 20, 30, "Hello world!");

window.add(t)

window.show
