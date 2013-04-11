# triangle.rb

class Triangle
  attr_accessor :x1, :y1, :c1,
                :x2, :y2, :c2,
                :x3, :y3, :c3
  attr_reader :color

  def initialize(x1, y1, x2, y2, x3, y3, c="white")
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
    r, g, b, a = Color.rgba(c)
    @c1 = Window.get_color(r, g, b, a)
    @c2 = Window.get_color(r, g, b, a)
    @c3 = Window.get_color(r, g, b, a)
  end

end
