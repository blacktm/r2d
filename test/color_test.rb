require 'minitest/spec'
require 'minitest/autorun'

require 'r2d/exceptions'
require 'r2d/color'

describe R2D::Color do
  describe '.rgba' do
    it 'creates red' do
      R2D::Color.rgba('red').must_equal [255, 0, 0, 255]
    end

    it 'creates green' do
      R2D::Color.rgba('green').must_equal [0, 255, 0, 255]
    end

    it 'creates blue' do
      R2D::Color.rgba('blue').must_equal [0, 0, 255, 255]
    end

    it 'creates black' do
      R2D::Color.rgba('black').must_equal [0, 0, 0, 255]
    end

    it 'creates white' do
      R2D::Color.rgba('white').must_equal [255, 255, 255, 255]
    end

    it 'creates yellow' do
      R2D::Color.rgba('yellow').must_equal [255, 255, 0, 255]
    end

    it 'creates orange' do
      R2D::Color.rgba('orange').must_equal [255, 150, 0, 255]
    end

    it 'creates purple' do
      R2D::Color.rgba('purple').must_equal [150, 30, 150, 255]
    end

    it 'creates custom color' do
      R2D::Color.rgba([255, 0, 0, 255]).must_equal [255, 0, 0, 255]
      R2D::Color.rgba([0, 0, 255, 255]).must_equal [0, 0, 255, 255]
    end

    it 'raises an error when passed invalid input' do
      lambda { R2D::Color.rgba('invalid-color') }.must_raise R2D::R2DError
    end
  end
end
