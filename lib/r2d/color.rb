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
        
        # TODO: Value should be 0.0..1.0, otherwise raise Error
        @r, @g, @b, @a = c[0], c[1], c[2], c[3]
        
      else
        raise Error, "Color does not exist!"
      end
      
    end
    
    private
    
    ## No longer needed
    #
    # def to_val(n)
    #   if n.class == Fixnum
    #     return n
    #   elsif n.class == Float
    #     return (n * 255).to_i
    #   end
    # end
    
  end
end
