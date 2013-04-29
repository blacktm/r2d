# exceptions.rb

module R2D
  class R2DError < StandardError
    def initialize(msg)
      super(msg)
      # puts msg
      # puts "Occurred in:"
      # puts "  " + caller.last, "\n"
    end
  end
end
