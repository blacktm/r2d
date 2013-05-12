# line.rb

class Line
  
  attr_reader :x1, :y1, :x2, :y2, :w, :color,
              :qx1, :qy1, :qx2, :qy2, :qx3, :qy3, :qx4, :qy4,
              :c1, :c2, :c3, :c4
  
  def initialize(x1, y1, x2, y2, w, c="white", visible=true)
    @x1, @y1, @x2, @y2, @w, @color = x1, y1, x2, y2, w, c
    update_coords(x1, y1, x2, y2, w)
    update_color(c)
    if visible then add end
  end
  
  def x1=(x1)
    @x1 = x1
    update_coords(x1, @y1, @x2, @y2, @w)
  end
  
  def y1=(y1)
    @y1 = y1
    update_coords(@x1, y1, @x2, @y2, @w)
  end
  
  def x2=(x2)
    @x2 = x2
    update_coords(@x1, @y1, x2, @y2, @w)
  end
  
  def y2=(y2)
    @y2 = y2
    update_coords(@x1, @y1, @x2, y2, @w)
  end
  
  def w=(w)
    @w = w
    update_coords(@x1, @y1, @x2, @y2, w)
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
  
  def show; add end
  def hide; remove end
  
  private
  
  def update_coords(x1, y1, x2, y2, w)
    @qx1 = x1
    @qy1 = y1 - w/2
    @qx2 = x2
    @qy2 = y2 - w/2
    @qx3 = x1
    @qy3 = y1 + w/2
    @qx4 = x2
    @qy4 = y2 + w/2
  end
  
  def update_color(c)
    @c1 = R2D::Color.new(c)
    @c2 = R2D::Color.new(c)
    @c3 = R2D::Color.new(c)
    @c4 = R2D::Color.new(c)
  end
  
end
