require 'minitest/autorun'
require_relative 'my_reject'

class RejectTest < MiniTest::Test
  def test_for_range
    assert_equal [1, 2, 4, 5, 7, 8, 10], (1..10).my_reject { |i|  i % 3 == 0 }
  end

  def test_for_array
    assert_equal [1, 3, 5], [1, 2, 3, 4, 5].my_reject { |num| num.even? }
  end
end
