# quad.rb
# A class representing a quadrilateral

module R2d
  class Quad

    # x1,y1 == top left
    # x2,y2 == top right
    # x3,y3 == bottom left
    # x4,y4 == bottom right
    attr_reader :x, :y, :color,
                :x1, :y1, :c1,
                :x2, :y2, :c2,
                :x3, :y3, :c3,
                :x4, :y4, :c4

    def initialize(x1, y1, x2, y2, x3, y3, x4, y4, c="white")
      @x, @y, @width, @height, @color = x, y, w, h, c
      update_coords(x, y, w, h)
      update_color(c)
    end

    def color=(c)
      @color = c
      update_color(c)
    end

    def add
      Window.add(self)
    end

    def remove
      Window.remove(self)
    end

    private

    def update_color(c)
      r, g, b, a = Color.rgba(c)
      @c1 = Window.get_color(r, g, b, a)
      @c2 = Window.get_color(r, g, b, a)
      @c3 = Window.get_color(r, g, b, a)
      @c4 = Window.get_color(r, g, b, a)
    end
  end
end
