require 'minitest/autorun'

require 'r2d/exceptions'
require 'r2d/color'

describe R2D::Color do
  describe '.rgba' do

    {
      red:    [255, 0, 0, 255],
      green:  [0, 255, 0, 255],
      blue:   [0, 0, 255, 255],
      black:  [0, 0, 0, 255],
      white:  [255, 255, 255, 255],
      yellow: [255, 255, 0, 255],
      orange: [255, 150, 0, 255],
      purple: [150, 30, 150, 255]
    }
    .each_pair do |color, value|
      it 'creates #{color}' do
        R2D::Color.rgba("#{color}").must_equal value
      end
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
