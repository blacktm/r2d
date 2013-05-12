require 'r2d'

window width: 640, height: 480

s1 = Square.new(10, 10, 100)
s2 = Square.new(10, 120, 100)

s1.gradient = {
  top: "red",
  bottom: "blue"
}

window :show
