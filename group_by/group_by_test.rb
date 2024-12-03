require 'minitest/autorun'
require_relative 'my_group_by'

class GroupByTest < MiniTest::Test
  def test_all_group_with_itself
    assert_equal({0 => [0], 1 => [1], 2 => [2]}, [0, 1, 2].my_group_by(&:itself))
  end

  def test_simple_case
    assert_equal({0 => [3, 6], 1 => [1, 4], 2 => [2, 5]}, (1..6).my_group_by {|i| i % 3})
  end
end
