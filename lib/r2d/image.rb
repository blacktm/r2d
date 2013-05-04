# image.rb

class Image
  
  attr_accessor :x, :y
  attr_reader :width, :height, :f_x, :f_y
  
  def initialize(x, y, path, visible=true)
    @x, @y, @path = x, y, path
    @f_x, @f_y = 1, 1
    @image = R2D::Window.image(path)
    @o_w, @o_h = @image.width, @image.height
    @width, @height = @o_w, @o_h
    if visible then add end
  end
  
  def width=(w)
    @f_x = w / @o_w.to_f
    @width = w
  end
  
  def height=(h)
    @f_y = h / @o_h.to_f
    @height = h
  end
  
  def add
    R2D::Window.add(self)
  end
  
  def remove
    R2D::Window.remove(self)
  end
  
  def adapter
    @image
  end
  
end
