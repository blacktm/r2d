# image.rb

module R2D
  class Image
    attr_accessor :x, :y

    def initialize(x, y, path)
      @x, @y, @path = x, y, path
    end

  end
end
