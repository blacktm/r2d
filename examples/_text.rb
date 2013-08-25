require 'r2d'

window = R2D::Window.new

t1 = R2D::Text.new(100, 50, 20, "hello world")
t2 = R2D::Text.new(100, 100, 50, "hello world", 'blue')
t3 = R2D::Text.new(100, 200, 75, "hello world", 'red')

window.add([t1, t2, t3])

window.update do
  t3.x = window.mouse_x
  t3.y = window.mouse_y
end

window.show
