require 'r2d'

window width: 640, height: 480

t1 = Text.new(100, 50, 20, "hello world")
t2 = Text.new(100, 100, 50, "hello world", 'blue')
t3 = Text.new(100, 200, 75, "hello world", 'red')

# update do
#   t3.x = mouse_x
#   t3.y = mouse_y
# end

window :show
