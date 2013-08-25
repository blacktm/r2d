require 'r2d'

window = R2D::Window.new

s1 = R2D::Square.new(0, 0, 100, "green")
s2 = R2D::Square.new(100, 100, 100, [30, 100, 200, 255])

# window.add([s1, s2])

window.add(s1)
window.add(s2)

# window.on_key 'r' do
#   puts window.remove(s1)
# end

# window.on_key 'a' do
#   puts window.add(s1)
# end

# window.key_down 'l' do
#   s1.size += 10
# end

# window.key_down 's' do
#   s1.size -= 10
# end

# px = 5

# window.key_down 'left' do
#   s2.x -= px
# end

# window.key_down 'right' do
#   s2.x += px
# end

# window.key_down 'up' do
#   s2.y -= px
# end

# window.key_down 'down' do
#   s2.y += px
# end


# window.update do
#   s1.x = window.mouse_x
#   s1.y = window.mouse_y
# end


window.show
