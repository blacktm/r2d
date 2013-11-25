# quad.rb

module R2D
  class Quad
    # Coordinates from top, right in clockwise order:
    # x1,y1 == top left
    # x2,y2 == top right
    # x3,y3 == bottom right
    # x4,y4 == bottom left
    attr_accessor :x1, :y1, :c1,
                  :x2, :y2, :c2,
                  :x3, :y3, :c3,
                  :x4, :y4, :c4
    
    attr_reader :color
    
    def initialize(x1, y1, x2, y2, x3, y3, x4, y4, c="white")
      @type_id = 2
      @x1, @y1, @x2, @y2, @x3, @y3, @x4, @y4 = x1, y1, x2, y2, x3, y3, x4, y4
      @color = c
      update_color(c)
    end
    
    def color=(c)
      @color = c
      update_color(c)
    end
    
    private
    
    def update_color(c)
      @c1 = R2D::Color.new(c)
      @c2 = R2D::Color.new(c)
      @c3 = R2D::Color.new(c)
      @c4 = R2D::Color.new(c)
    end
  end
end
