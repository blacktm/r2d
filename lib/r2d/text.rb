# text.rb

class Text
  
  attr_accessor :x, :y
  attr_reader :h, :content, :color, :c
  
  def initialize(x, y, h, content, c="white", visible=true)
    @x, @y, @h, @content, @color = x, y, h, content, c
    update_color(c)
    @text = R2D::Window.text(h)
    if visible then add end
  end
  
  def color=(c)
    @color = c
    update_color(c)
  end
  
  def add
    R2D::Window.add(self)
  end
  
  def remove
    R2D::Window.remove(self)
  end
  
  def adapter
    @text
  end
  
  private
  
  def update_color(c)
    r, g, b, a = R2D::Color.rgba(c)
    @c = R2D::Window.get_color(r, g, b, a)
  end
  
end
