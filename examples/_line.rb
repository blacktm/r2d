require 'r2d'

window = R2D::Window.new

l1 = R2D::Line.new(100, 100, 300, 100, 25, "red")
l2 = R2D::Line.new(100, 100, 300, 100, 2, "green")

window.add([l1, l2])

window.key_down 'a' do
  l2.w += 1
end

window.key_down 's' do
  l2.w -= 1
end

window.key_down 'd' do
  l2.x1 = window.mouse_x
  l2.y1 = window.mouse_y
end

window.key_down 'f' do
  l2.x2 = window.mouse_x
  l2.y2 = window.mouse_y
end

window.show
