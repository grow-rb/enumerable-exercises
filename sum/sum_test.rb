require 'minitest/autorun'
require_relative 'my_sum'

class SumTest < Minitest::Test
  def test_hash_sum_with_block
    assert_equal 50, { 1 => 10, 2 => 20 }.my_sum {|k, v| k * v }
  end

  def test_range_sum_without_block
    assert_equal 55, (1..10).my_sum
  end

  def test_range_sum_with_block
    assert_equal 110, (1..10).my_sum {|v| v * 2 }
  end

  def test_new_object_sum_is_type_error
    assert_raises(TypeError) { [Object.new].each.my_sum }
  end

  def test_hash_sum_with_init
    assert_equal [1, 10, 2, 20], { 1 => 10, 2 => 20 }.my_sum([])
  end

  def test_string_sum
    assert_equal 'abc', "a\nb\nc".each_line.lazy.map(&:chomp).my_sum("")
  end
end