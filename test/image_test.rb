require 'minitest/spec'
require 'minitest/autorun'

require 'r2d/image'

describe R2D::Image do
  it 'has x and y coordinates' do
    image = R2D::Image.new(200, 300, 'path/to/image')
    image.x.must_equal 200
    image.y.must_equal 300
  end

  it 'can edit the x coordinate' do
    image = R2D::Image.new(200, 300, 'path/to/image')
    image.x = 100
    image.x.must_equal 100
  end

  it 'can edit the y coordinate' do
    image = R2D::Image.new(200, 300, 'path/to/image')
    image.y = 400
    image.y.must_equal 400
  end
end
