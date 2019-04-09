require 'minitest/autorun'
require_relative 'reject'

class RejectTest < MiniTest::Test
  def test_for_range
    assert_equal [1, 2, 4, 5, 7, 8, 10], (1..10).reject { |i|  i % 3 == 0 }
  end

  def test_for_array
    assert_equal [1, 3, 5], [1, 2, 3, 4, 5].reject { |num| num.even? }
  end
end
