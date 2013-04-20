require 'r2d'

window width: 640, height: 480

s1 = Square.new(0, 0, 100, "green", true)
s2 = Square.new(100, 100, 100, [30, 100, 200, 255], true)

on_key 'r' do
  puts s1.remove
end

on_key 'a' do
  puts s1.add
end

key_down 'l' do
  s1.size += 10
end

key_down 's' do
  s1.size -= 10
end

px = 5

key_down 'left' do
  s2.x -= px
end

key_down 'right' do
  s2.x += px
end

key_down 'up' do
  s2.y -= px
end

key_down 'down' do
  s2.y += px
end


update do
  s1.x = mouse_x
  s1.y = mouse_y
end


window :show
