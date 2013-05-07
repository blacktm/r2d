require 'minitest/autorun'
require 'r2d'

describe Square do
  before do
    R2D::Window.create width: 640, height: 480
    @square = Square.new(10, 20, 200)
  end

  it 'can have a size' do
    @square.size.must_equal 200
  end

  it 'can edit the height' do
    @square.size = 400
    @square.size.must_equal 400
  end
end