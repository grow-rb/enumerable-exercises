require 'minitest/autorun'
require_relative 'my_partition'

class PartitionTest < MiniTest::Test
  def test_it_works_with_even_odd
    assert_equal [[2, 4, 6], [1, 3, 5]], (1..6).my_partition { |v| v.even? }
  end
end
