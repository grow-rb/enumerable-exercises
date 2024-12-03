require 'minitest/autorun'
require_relative 'my_tally'

class TallyTest < MiniTest::Test
  def test_numbers
    assert_equal({1 => 3, 10 => 2, 100 => 4}, [1, 10, 100, 100, 10, 1, 100, 1, 100].my_tally)
  end
end
