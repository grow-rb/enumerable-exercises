require 'minitest/autorun'
require_relative 'map'

class MapTest < MiniTest::Test
  def test_with_block
    assert_equal [1, 2, 3].map {|i| i ** 2 }, [1, 4, 9]
  end

  def test_with_symbol_to_proc
    assert_equal [1, 2, 3].map(&:to_s), ['1', '2', '3']
  end

  def test_for_range
    assert_equal [1, 4, 9], (1..3).map {|i| i ** 2 }
  end
end
