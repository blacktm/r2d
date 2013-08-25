require 'r2d'

window = R2D::Window.new

img = R2D::Image.new(100, 100, 'media/gem.png')

window.add(img)

pos = true

window.key_down 'h' do
  if pos
    img.height += 1
  else
    img.height -= 1
  end
end

window.key_down 'w' do
  if pos
    img.width += 1
  else
    img.width -= 1
  end
end

window.on_key 's' do
  puts "width: " + img.width.to_s
  puts "height: " + img.height.to_s
end

window.on_key 'space' do
  if pos
    pos = false
  else
    pos = true
  end
end

window.show
