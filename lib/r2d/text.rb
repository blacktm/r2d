# text.rb

module R2D
  class Text
    
    attr_accessor :x, :y, :size, :text
    
    def initialize(x=0, y=0, size=20, text="Hello World!", font="Arial", c="white")
      unless File.exists? font
        raise Error, "Cannot find font file!"
      end
      
      @type_id = 4
      @x, @y, @size = x, y, size
      @text, @font, @color = text, font, c
      update_color(c)
      
      if RUBY_PLATFORM =~ /darwin/
        # TODO:
        #   1. Set font search paths
        #        /Library/Fonts
        #   2. If has file extention, use as path
        #      Else, search font paths:
        #        "#{font_paths}/#{font}.ttf"
      end
    end
    
    def color=(c)
      @color = c
      update_color(c)
    end
    
    def update_color(c)
      @c = R2D::Color.new(c)
    end
    
  end
end
