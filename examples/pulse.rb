require 'r2d'

window width: 425, height: 425

s1 = Square.new(100, 100, 100, [0, 0, 0, 0])
s2 = Square.new(100, 210, 100, [0, 0, 0, 0])
s3 = Square.new(210, 100, 100, [0, 0, 0, 0])
s4 = Square.new(210, 210, 100, [0, 0, 0, 0])
s5 = Square.new(150, 150, 110, [0, 0, 0, 255])
s6 = Square.new(155, 155, 100, [0, 0, 0, 255])

c = 0
switch = true

update do

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

window :show
