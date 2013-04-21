require 'r2d'

window width: 640, height: 480

r1 = Rectangle.new(0, 0, 100, 100, "blue")
r2 = Rectangle.new(100, 100, 100, 100, [30, 255, 200, 255])

on_key 'r' do
  puts r1.remove
end

on_key 'a' do
  puts r1.add
end

update do
  r1.x = mouse_x
  r1.y = mouse_y
end

window :show
