require 'minitest/autorun'
require_relative 'my_inject'

class InjectTest < Minitest::Test
  def test_sum_some_numbers
    assert_equal 45, (5..10).my_inject(:+)
  end

  def test_sum_numbers_with_block
    assert_equal 45, (5..10).my_inject {|sum, n| sum + n }
  end

  def test_multiple_some_numbers
    assert_equal 151200, (5..10).my_inject(1, :*)
  end

  def test_multiple_some_numbers_with_block
    assert_equal 151200, (5..10).my_inject(1) {|product, n| product * n}
  end

  def test_finding_the_longest_word
    assert_equal 'sheep', %w(cat sheep bear).my_inject {|memo, word| memo.length > word.length ? memo : word}
  end
end
