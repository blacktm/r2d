require 'test/unit'
require './lib/r2d'

class TestSquare < Test::Unit::TestCase

  def test_size
    assert_equal(4, ::R2d::Square.new())
  end

end
