# text.rb

module R2D
  class Text
    
    attr_accessor :x, :y, :size, :text
    
    def initialize(x=0, y=0, size=20, text="Hello World!")
      @type_id = 4
      @x, @y, @size, @text = x, y, size, text
    end
    
  end
end
