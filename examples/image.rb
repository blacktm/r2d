require 'r2d'

window width: 640, height: 480

img = Image.new(100, 100, 'media/gem.png')

pos = true

key_down 'h' do
  if pos
    img.height += 1
  else
    img.height -= 1
  end
end

key_down 'w' do
  if pos
    img.width += 1
  else
    img.width -= 1
  end
end

on_key 's' do
  puts "width: " + img.width.to_s
  puts "height: " + img.height.to_s
end


on_key 'space' do
  if pos
    pos = false
  else
    pos = true
  end
end

window :show
