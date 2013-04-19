# rectangle.rb

module R2d
  class Rectangle

    # x1,y1 == top left
    # x2,y2 == top right
    # x3,y3 == bottom left
    # x4,y4 == bottom right
    attr_reader :x, :y, :width, :height, :color,
                :x1, :y1, :c1,
                :x2, :y2, :c2,
                :x3, :y3, :c3,
                :x4, :y4, :c4

    def initialize(x, y, w, h, c="white")
      @x, @y, @width, @height, @color = x, y, w, h, c
      update_coords(x, y, w, h)
      update_color(c)
    end

    def x=(x)
      @x1 = x
      @x2 = x + @width
      @x3 = x
      @x4 = x + @width
    end

    def y=(y)
      @y1 = y
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

    def update_color(c)
      r, g, b, a = Color.rgba(c)
      @c1 = Window.get_color(r, g, b, a)
      @c2 = Window.get_color(r, g, b, a)
      @c3 = Window.get_color(r, g, b, a)
      @c4 = Window.get_color(r, g, b, a)
    end
  end
end
