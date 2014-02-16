# triangle.rb

module R2D
  class Triangle
    
    attr_accessor :x1, :y1, :c1,
                  :x2, :y2, :c2,
                  :x3, :y3, :c3
    attr_reader :color
    
    def initialize(x1, y1, x2, y2, x3, y3, c="white")
      @type_id = 1
      @x1, @y1 = x1, y1
      @x2, @y2 = x2, y2
      @x3, @y3 = x3, y3
      @color = c
      update_color(c)
    end
    
    def color=(c)
      update_color(c)
      @color = c
    end
    
    private
    
    def update_color(c)
      @c1 = R2D::Color.new(c)
      @c2 = R2D::Color.new(c)
      @c3 = R2D::Color.new(c)
    end
    
  end
end
