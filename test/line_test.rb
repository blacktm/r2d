require 'minitest/spec'
require 'minitest/autorun'

require 'r2d'

describe Line do
  before do
    window width: 640, height: 480
    @line = Line.new(20, 25, 100, 150, 10)
  end

  it "has x and y coordinates" do
    @line.x1.must_equal 20
    @line.y1.must_equal 25
    @line.x2.must_equal 100
    @line.y2.must_equal 150
  end

  it 'can edit the x1 coordinate' do
    @line.x1 = 30
    @line.x1.must_equal 30
  end

  it 'can edit the y1 coordinate' do
    @line.y1 = 50
    @line.y1.must_equal 50
  end

  it 'can edit the x2 coordinate' do
    @line.x2 = 90
    @line.x2.must_equal 90
  end

  it 'can edit the y2 coordinate' do
    @line.y2 = 100
    @line.y2.must_equal 100
  end

  it 'can edit the width' do
    @line.w = 15
    @line.w.must_equal 15
  end

  it 'can edit the color' do
    @line.color = "red"
    @line.color.must_equal "red"
  end
end