# helpers.rb

module R2D
  module Helpers
    def draw_line(x1, y1, x2, y2, c)
      Window.add(Line.new(x1, y1, x2, y2, c))
      return nil
    end

    def draw_triangle(x1, y1, x2, y2, x3, y3, c)
      Window.add(Triangle.new(x1, y1, x2, y2, x3, y3, c))
      return nil
    end

    def draw_rect(x, y, w, h, c)
      Window.add(Rectangle.new(x, y, w, h, c))
      return nil
    end

    def draw_square(x, y, s, c)
      Window.add(Square.new(x, y, s, c))
      return nil
    end

    def key_down?(key)
      Window.key_down?(key)
    end
    
    def update(&block)
      Window.update(&block)
    end
    
    def window(opts={})
      if opts == :show
        Window.show
      else
        Window.create(width: opts[:width],
                      height: opts[:height],
                      background: opts[:background],
                      fullscreen: opts[:fullscreen])
      end
    end
  end
end

include R2D::Helpers
