# square.rb

module R2d
  class Square
    attr_reader :x, :y, :size, :color

    def initialize(x, y, s, c="white")
      @x, @y, @size, @color = x, y, s, c

      @r = Rectangle.new(@x, @y, @size, @size, c)
    end

    def color=(c)
      @r.color = c
    end

    def x=(x)
      @r.x = x
    end

    def y=(y)
      @r.y = y
    end

    def s=(s)
      @r.width = @r.height = s
    end

  end
end
