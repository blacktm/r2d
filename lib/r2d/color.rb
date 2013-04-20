# color.rb

module R2D
  class Color
    def self.rgba(c)
      case c
      when "red"
        r, g, b, a = 255, 0, 0, 255
      when "green"
        r, g, b, a = 0, 255, 0, 255
      when "blue"
        r, g, b, a = 0, 0, 255, 255
      when "black"
        r, g, b, a = 0, 0, 0, 255
      when "white"
        r, g, b, a = 255, 255, 255, 255
      when "yellow"
        r, g, b, a = 255, 255, 0, 255
      when "orange"
        r, g, b, a = 255, 150, 0, 255
      when "purple"
        r, g, b, a = 150, 30, 150, 255
      when Array
        r, g, b, a = c[0], c[1], c[2], c[3]
      else
        raise LearnRubyError, "That color doesn't exist!"
      end

      return r, g, b, a
    end
  end
end
