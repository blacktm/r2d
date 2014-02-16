# image.rb

module R2D
  class Image
    
    attr_accessor :x, :y
    
    def initialize(x, y, path)
      unless File.exists? path
        raise Error, "Cannot find image file!"
      end
      
      @type_id = 3
      @x, @y, @path = x, y, path
    end
    
  end
end
