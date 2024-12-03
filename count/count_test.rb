require 'minitest/autorun'
require_relative 'my_count'

class CountTest < MiniTest::Test
  def setup
    @ary = [1, 2, 4, 2]
    @hash = {foo: 42, bar: 3, buzz: 10}
  end

  def test_array_count_without_argument_or_block
    assert_equal 4, @ary.my_count
  end

  def test_array_count_with_argument
    assert_equal 2, @ary.my_count(2)
  end

  def test_array_count_with_block
    assert_equal 3, @ary.my_count {|x| x % 2 == 0 }
  end

  def test_hash_count_without_argument_or_block
    assert_equal 3, @hash.my_count
  end

  def test_hash_count_with_argument
    assert_equal 1, @hash.my_count([:foo, 42])
  end

  def test_hash_count_with_block
    assert_equal 2, @hash.my_count {|k, v| v % 2 == 0 }
  end
end
