module Enumerable
  def average
    sum / count.to_f
  end
end

def math_great_students(students)
  students.select{ |student| student[:grade][:math] > 8 }
end

def math_average_grade(students)
  students.map{ |student| student[:grade][:math] }.average
end

def english_favorite_count(students)
  students.count{ |student| student[:favorites].include? :english }
end

def total_all_grades(students)
  students.sum{ |student| student[:grade].sum{ |k, v| v } }
end

def split_into_two_groups(students)
  students.partition{ |student| student[:favorites].include? :math }
end

def total_favorite_grades_for_each_student(students)
  students.map{ |student| [student[:name].to_sym, student[:grade].select{ |k| student[:favorites].include?(k) }.values.sum] }.to_h
end