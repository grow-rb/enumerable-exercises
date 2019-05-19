require 'minitest/autorun'
class Array
  undef all?, any?, include?, one?, none?
end

require_relative 'predicates'

class PredicatesTest < MiniTest::Test
  def test_all_with_block
    assert %w[ant bear cat].all? { |word| word.length >= 3 }
    refute %w[ant bear cat].all? { |word| word.length >= 4 }
  end

  def test_all_with_pattern
    refute %w[ant bear cat].all?(/t/)
    assert [1, 2i, 3.14].all?(Numeric)
    refute [nil, true, 99].all?
    assert [].all?
  end

  def test_any_with_block
    assert %w[ant bear cat].any? { |word| word.length >= 3 }
    assert %w[ant bear cat].any? { |word| word.length >= 4 }
  end

  def test_any_with_pattern
    refute %w[ant bear cat].any?(/d/)
    assert [nil, true, 99].any?(Integer)
    assert [nil, true, 99].any?
    refute [].any?
  end

  def test_include
    assert ["a", "b", "c"].include?("b")
    refute ["a", "b", "c"].include?("z")
  end

  def test_one_with_block
    assert %w{ant bear cat}.one? { |word| word.length == 4 }
    refute %w{ant bear cat}.one? { |word| word.length > 4 }
    refute %w{ant bear cat}.one? { |word| word.length < 4 }
  end

  def test_one_with_pattern
    refute [nil, true, 99].one?
    assert [nil, true, false].one?
    assert [nil, true, 99].one?(Integer)
    refute [].one?
  end

  def test_none_with_block
    assert %w{ant bear cat}.none? { |word| word.length == 5 }
    refute %w{ant bear cat}.none? { |word| word.length >= 4 }
  end

  def test_none_with_pattern
    assert %w{ant bear cat}.none?(/d/)
    refute [1, 3.14, 42].none?(Float)
    assert [].none?
    assert [nil].none?
    assert [nil, false].none?
    refute [nil, false, true].none?
  end
end
