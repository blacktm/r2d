require 'r2d'

window width: 640, height: 480

l1 = Line.new(100, 100, 300, 100, 25, "red")
l2 = Line.new(100, 100, 300, 100, 2, "green")

key_down 'a' do
  l2.w += 1
end

key_down 's' do
  l2.w -= 1
end

key_down 'd' do
  l2.x1 = mouse_x
  l2.y1 = mouse_y
end

key_down 'f' do
  l2.x2 = mouse_x
  l2.y2 = mouse_y
end

window :show
