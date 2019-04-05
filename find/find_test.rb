require 'minitest/autorun'
require_relative 'find'

class FindTest < MiniTest::Test
  def test_without_ifnone_finding_nothing
    refute (1..10).find {|i| i % 5 == 0 && i % 7 == 0 }
  end

  def test_without_ifnone_finding_something
    assert_equal 35, (1..100).find {|i| i % 5 == 0 && i % 7 == 0 }
  end

  def test_with_ifnone_finding_something
    not_found = -> { 'NOT FOUND' }
    assert_equal 35, (1..100).find(not_found) {|i| i % 5 == 0 && i % 7 == 0 }
  end

  def test_with_ifnone_finding_nothing
    not_found = -> { 'NOT FOUND' }
    assert_equal 'NOT FOUND', (1..10).find(not_found) {|i| i % 5 == 0 && i % 7 == 0 }
  end
end
