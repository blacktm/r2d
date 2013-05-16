require 'minitest/autorun'

require 'r2d'

describe Rectangle do
  before do
    window width: 640, height: 480
    @rectangle = Rectangle.new(10, 20, 300, 500)
  end

  it 'can have x and y coordinates' do
    @rectangle.x.must_equal 10
    @rectangle.y.must_equal 20
  end

  it 'can have a width' do
    @rectangle.width.must_equal 300
  end

  it 'can have a height' do
    @rectangle.height.must_equal 500
  end

  it 'can edit the x coordinate' do
    @rectangle.x = 30
    @rectangle.x.must_equal 30
  end

  it 'can edit the y coordinate' do
    @rectangle.y = 25
    @rectangle.y.must_equal 25
  end

  it 'can edit the width' do
    @rectangle.width = 250
    @rectangle.width.must_equal 250
  end

  it 'can edit the height' do
    @rectangle.height = 450
    @rectangle.height.must_equal 450
  end
end
