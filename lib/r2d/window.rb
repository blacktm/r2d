# window.rb

module R2D
  class Window
    attr_accessor :w, :h, :title, :bg, :cursor, :fs
    
    def initialize(w: 640, h: 480, title: "R2D", bg: nil, cursor: true, fs: false)
      @w, @h, @title, @bg, @cursor, @fs, = w, h, title, bg, cursor, fs
      
      @objects = []
      @on_keys = {}
      @keys_down = {}
      @update_proc = Proc.new {}
      
      # testing
      @count = 0
    end
    
    def add(o)
      if !@objects.include?(o)
        @objects.push(o)
        true
      else
        false
      end
    end
    
    def remove(o)
      if i = @objects.index(o)
        @objects.slice!(i)
        true
      else
        false
      end
    end
    
    def clear
      @objects.clear
    end
    
    def draw
      puts @count
      @count += 1
      
      @objects.each do |o|
        case o
        when Line
        when Triangle
          draw_triangle(
            o.x1, o.y1, o.c1,
            o.x2, o.y2, o.c2,
            o.x3, o.y3, o.c3
          )
        when Quad
          draw_triangle(
            o.x1, o.y1, o.c1,
            o.x2, o.y2, o.c2,
            o.x3, o.y3, o.c3
          )
          draw_triangle(
            o.x3, o.y3, o.c1,
            o.x4, o.y4, o.c2,
            o.x1, o.y1, o.c3
          )
        when Image
          draw_image(o.x, o.y)
        when Text
          draw_text(o.x, o.y, o.c)
        else
          raise Error, "Cannot draw type '#{o.class}'"
        end
      end
    end
    
  end
end












