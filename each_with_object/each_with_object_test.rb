require 'minitest/autorun'
require_relative 'my_each_with_object'

class EachWithObjectTest < MiniTest::Test
  def test_when_memo_is_array
    assert_equal [2, 4, 6, 8, 10], (1..5).my_each_with_object([]) {|i, a| a << i * 2 }
  end

  def test_when_memo_is_a_string
    assert_equal 'Hello, ALICE', %w(a li ce).my_each_with_object('Hello, ') {|str, memo| memo << str.upcase }
  end
end
