require 'r2d'

window width: 640, height: 480

draw_rect(0, 0, 100, 100, "yellow")
draw_rect(100, 100, 100, 100, "orange")
draw_rect(200, 200, 100, 100, "green")
draw_rect(300, 300, 100, 100, [30, 255, 200, 255])

window :show
