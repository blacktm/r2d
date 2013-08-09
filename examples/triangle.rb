require 'r2d'

window = R2D::Window.new

t = R2D::Triangle.new(100, 100, 300, 100, 300, 400, "red")

window.add(t)

window.key_down 'a' do
  t.x1 = window.mouse_x
  t.y1 = window.mouse_y
end

window.key_down 's' do
  t.x2 = window.mouse_x
  t.y2 = window.mouse_y
end

window.key_down 'd' do
  t.x3 = window.mouse_x
  t.y3 = window.mouse_y
end

window.show
