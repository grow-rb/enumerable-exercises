require 'minitest/autorun'
require_relative 'group_by'

class TestGroupBy < MiniTest::Test
  def test_all_group_with_itself
    assert_equal({0 => [0], 1 => [1], 2 => [2]}, [0, 1, 2].group_by(&:itself))
  end

  def test_simple_case
    assert_equal({0 => [3, 6], 1 => [1, 4], 2 => [2, 5]}, (1..6).group_by {|i| i % 3})
  end
end
