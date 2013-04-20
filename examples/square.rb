require 'r2d'

Window.create

s1 = Square.new(0, 0, 100, "green")
s2 = Square.new(100, 100, 100, [30, 100, 200, 255])

s1.add
s2.add


Window.on_key 'r' do
  puts s1.remove
end

Window.on_key 'a' do
  puts s1.add
end

Window.key_down 'l' do
  s1.size += 10
end

Window.key_down 's' do
  s1.size -= 10
end

px = 5

Window.key_down 'left' do
  s2.x -= px
end

Window.key_down 'right' do
  s2.x += px
end

Window.key_down 'up' do
  s2.y -= px
end

Window.key_down 'down' do
  s2.y += px
end


Window.update do
  s1.x = Window.mouse_x
  s1.y = Window.mouse_y
end


Window.show
