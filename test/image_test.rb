require 'minitest/spec'
require 'minitest/autorun'

require 'r2d/image'

describe Image do
  before do
    R2D::Window.create width: 640, height: 480
  end

  it 'has x and y coordinates' do
    image = Image.new(200, 300, 'test/fixtures/sample_image.gif')
    image.x.must_equal 200
    image.y.must_equal 300
  end

  it 'can edit the x coordinate' do
    image = Image.new(200, 300, 'test/fixtures/sample_image.gif')
    image.x = 100
    image.x.must_equal 100
  end

  it 'can edit the y coordinate' do
    image = Image.new(200, 300, 'test/fixtures/sample_image.gif')
    image.y = 400
    image.y.must_equal 400
  end
end
