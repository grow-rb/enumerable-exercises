class Array
  undef uniq
end

module Enumerable
  undef uniq
end

require_relative 'uniq'
require 'minitest/autorun'

class UniqTest < MiniTest::Test
  def test_without_block
    assert_equal ["a", "b", "c"], ["a", "a", "b", "b", "c"].uniq
  end

  def test_with_block
    assert_equal [["student", "sam"], ["teacher", "matz"]], [["student","sam"], ["student","george"], ["teacher","matz"]].uniq {|s| s.first }
  end

  def test_for_hash
    assert_equal([[:foo, :bar]], {foo: :bar, buzz: :bar}.uniq {|e| e.last})
  end
end
