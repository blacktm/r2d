require 'r2d'

window = R2D::Window.new(width: 415, height: 415)

s1 = R2D::Square.new(100, 100, 100, [0, 0, 0, 0])
s2 = R2D::Square.new(100, 210, 100, [0, 0, 0, 0])
s3 = R2D::Square.new(210, 100, 100, [0, 0, 0, 0])
s4 = R2D::Square.new(210, 210, 100, [0, 0, 0, 0])
s5 = R2D::Square.new(150, 150, 110, [0, 0, 0, 255])
s6 = R2D::Square.new(155, 155, 100, [0, 0, 0, 255])

window.add([s1, s2, s3, s4, s5, s6])

c = 0
switch = true

window.update do

  if switch
    c += 5
    if c > 255
      switch = false
    end
  else 
    c -= 5
    if c < 0
      switch = true
    end
  end
  
  s1.color = [c, 100, 200, 255]
  s2.color = [100, c, 200, 255]
  s3.color = [100, 200, c, 255]
  s4.color = [75, c, 255, 255]
  
  if c < 0 or c > 255
    s6.color = [rand(0..255), rand(0..255), rand(0..255), 255]
  end
end

window.show
