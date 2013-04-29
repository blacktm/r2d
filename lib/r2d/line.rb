# line.rb

class Line < Quad
  
  attr_reader :x1, :y1, :x2, :y2, :w, :color
  
  def initialize(x1, y1, x2, y2, w, c="white", visible=true)
    @x1, @y1, @x2, @y2, @w = x1, y1, x2, y2, w
    @color = c
    update_color(c)
    if visible then add end
  end
  
  def x1=(x1)
    @x1 = x1
  end
  
  def y1=(y1)
    @y1 = y1
  end
  
  def x2=(x2)
    @x2 = x2
  end
  
  def y2=(y2)
    @y2 = y2
  end
  
  def w=(w)
    @w = w
    @x3
    @y3
  end
  
  def color=(c)
    update_color(c)
    @color = c
  end
  
  private
  
  def update_color(c)
    r, g, b, a = R2D::Color.rgba(c)
    @c1 = R2D::Window.get_color(r, g, b, a)
    @c2 = R2D::Window.get_color(r, g, b, a)
    @c3 = R2D::Window.get_color(r, g, b, a)
    @c4 = R2D::Window.get_color(r, g, b, a)
  end
  
  def update_coords(x1, y1, x2, y2, w)
    @x1 = 1
    @y1 = 1
    @x2 = 1
    @y2 = 1
    @x3 = 1
    @y3 = 1
    @x4 = 1
    @y4 = 1
  end
  
end
