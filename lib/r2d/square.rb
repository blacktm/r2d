# square.rb

module R2D
  class Square < R2D::Rectangle
    
    attr_reader :size
    
    def initialize(x=0, y=0, s=100, c="white", visible=true)
      @x, @y, @color = x, y, c
      @width = @height = @size = s
      update_coords(x, y, s, s)
      update_color(c)
    end
    
    def size=(s)
      self.width = self.height = @size = s
    end
    
    private :width=, :height=
  end
end
