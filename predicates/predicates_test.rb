require 'minitest/autorun'
require_relative 'my_predicates'

class PredicatesTest < MiniTest::Test
  def test_all_with_block
    assert %w[ant bear cat].my_all? { |word| word.length >= 3 }
    refute %w[ant bear cat].my_all? { |word| word.length >= 4 }
  end

  def test_all_with_pattern
    refute %w[ant bear cat].my_all?(/t/)
    assert [1, 2i, 3.14].my_all?(Numeric)
    refute [nil, true, 99].my_all?
    assert [].my_all?
  end

  def test_any_with_block
    assert %w[ant bear cat].my_any? { |word| word.length >= 3 }
    assert %w[ant bear cat].my_any? { |word| word.length >= 4 }
  end

  def test_any_with_pattern
    refute %w[ant bear cat].my_any?(/d/)
    assert [nil, true, 99].my_any?(Integer)
    assert [nil, true, 99].my_any?
    refute [].my_any?
  end

  def test_include
    assert ["a", "b", "c"].my_include?("b")
    refute ["a", "b", "c"].my_include?("z")
  end

  def test_one_with_block
    assert %w{ant bear cat}.my_one? { |word| word.length == 4 }
    refute %w{ant bear cat}.my_one? { |word| word.length > 4 }
    refute %w{ant bear cat}.my_one? { |word| word.length < 4 }
  end

  def test_one_with_pattern
    refute [nil, true, 99].my_one?
    assert [nil, true, false].my_one?
    assert [nil, true, 99].my_one?(Integer)
    refute [].my_one?
  end

  def test_none_with_block
    assert %w{ant bear cat}.my_none? { |word| word.length == 5 }
    refute %w{ant bear cat}.my_none? { |word| word.length >= 4 }
  end

  def test_none_with_pattern
    assert %w{ant bear cat}.my_none?(/d/)
    refute [1, 3.14, 42].my_none?(Float)
    assert [].my_none?
    assert [nil].my_none?
    assert [nil, false].my_none?
    refute [nil, false, true].my_none?
  end
end
