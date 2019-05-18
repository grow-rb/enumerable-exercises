module Enumerable
  undef partition
end

require_relative 'partition'
require 'minitest/autorun'

class PartitionTest < MiniTest::Test
  def test_it_works_with_even_odd
    assert_equal [[2, 4, 6], [1, 3, 5]], (1..6).partition { |v| v.even? }
  end
end
