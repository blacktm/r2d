# color.rb

module R2D
  class Color
    
    attr_reader :r, :g, :b, :a
    
    def initialize(c)
      case c
      when "red"
        @r, @g, @b, @a = 1, 0, 0, 1
      when "green"
        @r, @g, @b, @a = 0, 1, 0, 1
      when "blue"
        @r, @g, @b, @a = 0, 0, 1, 1
      when "black"
        @r, @g, @b, @a = 0, 0, 0, 1
      when "white"
        @r, @g, @b, @a = 1, 1, 1, 1
      when "yellow"
        @r, @g, @b, @a = 1, 1, 0, 1
      when "random"
        @r, @g, @b, @a = rand(0.0..1.0), rand(0.0..1.0), rand(0.0..1.0), 1
      when Array
        @r, @g, @b, @a = to_f(c[0]), to_f(c[1]), to_f(c[2]), to_f(c[3])
      else
        raise Error, "Color does not exist!"
      end
    end
    
    private
    
    # Convert from 0.0..1.0 to Uint8 (0..255)
    def to_f(n)
      if n.class == Float
        return n
      elsif n.class == Fixnum
        return n / 255.0
      end
    end
    
  end
end
