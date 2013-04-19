# text.rb

module R2d
  class Text
    attr_accessor :x1, :y1, :text
    attr_reader :color

    def initialize(x1, y1, text, c="white")
      @x1, @y1 = x1, y1
      @text, @color = text, c
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
    end

  end
end
