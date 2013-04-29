# circle.rb
# https://gist.github.com/661266

class Circle
  attr_reader :columns, :rows

  def initialize radius
    @columns = @rows = radius * 2
    lower_half = (0...radius).map do |y|
      x = Math.sqrt(radius**2 - y**2).round
      right_half = "#{"\xff" * x}#{"\x00" * (radius - x)}"
      "#{right_half.reverse}#{right_half}"
    end.join
    @blob = lower_half.reverse + lower_half
    @blob.gsub!(/./) { |alpha| "\xff\xff\xff#{alpha}"}
  end

  def to_blob
    @blob
  end
end

# class TestWin < Gosu::Window
#   def initialize
#     super 400, 400, false
#
#     @img = Gosu::Image.new(self, Circle.new(200), false)
#   end
#
#   def draw
#     @img.draw 0, 0, 0
#   end
# end
#
# TestWin.new.show
