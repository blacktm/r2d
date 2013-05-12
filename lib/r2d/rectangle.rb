# rectangle.rb

class Rectangle < Quad
  
  attr_reader :x, :y, :width, :height
  
  def initialize(x, y, w, h, c="white", visible=true)
    @x, @y, @width, @height, @color = x, y, w, h, c
    update_coords(x, y, w, h)
    update_color(c)
    if visible then add end
  end
  
  def x=(x)
    @x = @x1 = x
    @x2 = x + @width
    @x3 = x
    @x4 = x + @width
  end
  
  def y=(y)
    @y = @y1 = y
    @y2 = y
    @y3 = y + @height
    @y4 = y + @height
  end
  
  def width=(w)
    @width = w
    update_coords(@x, @y, w, @height)
  end
  
  def height=(h)
    @height = h
    update_coords(@x, @y, @width, h)
  end
  
  def gradient=(g)
    if g[:top]
      # r, g, b, a = R2D::Color.rgba(g[:top])
      # @c1 = @c2 = R2D::Window.get_color(r, g, b, a)
    end
    
    p g.class
    
    # if g[:bottom]
    #   r, g, b, a = R2D::Color.rgba(g[:bottom])
    #   @c3 = @c4 = R2D::Window.get_color(r, g, b, a)
    # end
    
    # if g[:left]
    #   r, g, b, a = R2D::Color.rgba(g[:left])
    #   @c1 = @c3 = R2D::Window.get_color(r, g, b, a)
    # end
    
    # if g[:right]
    #   r, g, b, a = R2D::Color.rgba(g[:right])
    #   @c2 = @c4 = R2D::Window.get_color(r, g, b, a)
    # end
    
    # if g[:top_left]
    #   r, g, b, a = R2D::Color.rgba(g[:top_left])
    #   @c1 = R2D::Window.get_color(r, g, b, a)
    # end
    
    # if g[:top_right]
    #   r, g, b, a = R2D::Color.rgba(g[:top_right])
    #   @c2 = R2D::Window.get_color(r, g, b, a)
    # end
    
    # if g[:bottom_left]
    #   r, g, b, a = R2D::Color.rgba(g[:bottom_left])
    #   @c3 = R2D::Window.get_color(r, g, b, a)
    # end
    
    # if g[:bottom_right]
    #   r, g, b, a = R2D::Color.rgba(g[:bottom_right])
    #   @c4 = R2D::Window.get_color(r, g, b, a)
    # end
  end
  
  private
  
  def update_coords(x, y, w, h)
    @x1 = x
    @y1 = y
    @x2 = x + w
    @y2 = y
    @x3 = x
    @y3 = y + h
    @x4 = x + w
    @y4 = y + h
  end
  
end
