require 'minitest/autorun'
require_relative 'my_uniq'

class UniqTest < Minitest::Test
  def test_without_block
    assert_equal ["a", "b", "c"], ["a", "a", "b", "b", "c"].my_uniq
  end

  def test_with_block
    assert_equal [["student", "sam"], ["teacher", "matz"]], [["student","sam"], ["student","george"], ["teacher","matz"]].my_uniq {|s| s.first }
  end

  def test_for_hash
    assert_equal([[:foo, :bar]], {foo: :bar, buzz: :bar}.my_uniq {|e| e.last})
  end
end