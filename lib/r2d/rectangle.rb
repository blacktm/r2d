# rectangle.rb

module R2D
  class Rectangle < R2D::Quad
    
    attr_reader :x, :y, :width, :height
    
    def initialize(x, y, w, h, c="white")
      @type_id = 2
      @x, @y, @width, @height, @color = x, y, w, h, c
      update_coords(x, y, w, h)
      update_color(c)
    end
    
    def x=(x)
      @x = @x1 = x
      @x2 = x + @width
      @x3 = x + @width
      @x4 = x
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
    
    private
    
    def update_coords(x, y, w, h)
      @x1 = x
      @y1 = y
      @x2 = x + w
      @y2 = y
      @x4 = x
      @y4 = y + h
      @x3 = x + w
      @y3 = y + h
    end
    
  end
end
