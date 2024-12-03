require 'minitest/autorun'
require_relative 'my_map'

class MyMapTest < MiniTest::Test
  def test_with_block
    assert_equal [1, 4, 9], [1, 2, 3].my_map {|i| i ** 2 }
  end

  def test_with_symbol_to_proc
    assert_equal ['1', '2', '3'], [1, 2, 3].my_map(&:to_s)
  end

  def test_for_range
    assert_equal [1, 4, 9], (1..3).my_map {|i| i ** 2 }
  end
end
