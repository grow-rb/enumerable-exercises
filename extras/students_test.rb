require 'minitest/autorun'
require_relative 'students'

class StudentsTest < Minitest::Test
  def setup
    @students = [
      {
        name: 'Alice',
        grade: {math: 9, english: 8, science: 6},
        favorites: [:math, :english],
      },
      {
        name: 'Bob',
        grade: {math: 4, english: 5, science: 8},
        favorites: [:science],
      },
      {
        name: 'Chris',
        grade: {math: 10, english: 4, science: 9},
        favorites: [:math, :science],
      },
      {
        name: 'Daniel',
        grade: {math: 3, english: 10, science: 4},
        favorites: [:english],
      },
      {
        name: 'Eileen',
        grade: {math: 7, english: 8, science: 9},
        favorites: [:math, :english, :science],
      },
    ]
  end

  def test_math_great_students
    assert_equal %w(Alice Chris), math_great_students(@students).map {|student| student[:name] }
  end

  def test_math_average_grade
    assert_equal 6.6, math_average_grade(@students)
  end

  def test_english_favorite_count
    assert_equal 3, english_favorite_count(@students)
  end

  def test_total_all_grades
    assert_equal 104, total_all_grades(@students)
  end

  def test_split_into_two_groups
    assert_equal [['Alice', 'Chris', 'Eileen'], ['Bob', 'Daniel']], split_into_two_groups(@students).map {|group| group.map {|student| student[:name] } }
  end

  def test_total_favorite_grades_for_each_student
    result = {Alice: 17, Bob: 8, Chris: 19, Daniel: 10, Eileen: 24}
    assert_equal result, total_favorite_grades_for_each_student(@students)
  end
end