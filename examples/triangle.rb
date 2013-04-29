require 'r2d'

window width: 640, height: 480

t = Triangle.new(100, 100, 300, 100, 300, 400, "red")

key_down 'a' do
  t.x1 = mouse_x
  t.y1 = mouse_y
end

key_down 's' do
  t.x2 = mouse_x
  t.y2 = mouse_y
end

key_down 'd' do
  t.x3 = mouse_x
  t.y3 = mouse_y
end

window :show
