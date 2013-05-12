# color.rb

module R2D
  class Color
    
    attr_reader :r, :g, :b, :a, :adapter
    
    def initialize(c)
      case c
      when "red"
        @r, @g, @b, @a = 255, 0, 0, 255
      when "green"
        @r, @g, @b, @a = 0, 255, 0, 255
      when "blue"
        @r, @g, @b, @a = 0, 0, 255, 255
      when "black"
        @r, @g, @b, @a = 0, 0, 0, 255
      when "white"
        @r, @g, @b, @a = 255, 255, 255, 255
      when "yellow"
        @r, @g, @b, @a = 255, 255, 0, 255
      when "orange"
        @r, @g, @b, @a = 255, 150, 0, 255
      when "purple"
        @r, @g, @b, @a = 150, 30, 150, 255
      when Array
        @r, @g = to_val(c[0]), to_val(c[1])
        @b, @a = to_val(c[2]), to_val(c[3])
      else
        raise R2DError, "Color does not exist!"
      end
      
      @adapter = R2D::Adapters.get_color(r, g, b, a)
    end
    
    private
    
    def to_val(n)
      if n.class == Fixnum
        return n
      elsif n.class == Float
        return (n * 255).to_i
      end
    end
  end
end
