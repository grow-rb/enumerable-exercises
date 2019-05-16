def math_great_students(students)
  students.filter do |student|
    student[:grade][:math] > 8
  end
end

def math_average_grade(students)
  students.sum do |student|
    student[:grade][:math]
  end.to_f / students.size
end

def english_favorite_count(students)
  students.count do |student|
    student[:favorites].include? :english
  end
end

def total_all_grades(students)
  students.sum do |student|
    student[:grade].sum do |subject, score|
      score
    end
  end
end

def split_into_two_groups(students)
  average_grade = total_all_grades(students).to_f / students.size
  students.partition do |student|
    total_grade = student[:grade].sum do |subject, score|
      score
    end
    total_grade > average_grade
  end
end

def total_favorite_grades_for_each_student(students)
  students.each_with_object({}) do |student, result|
    total_grade = student[:grade].sum do |subject, score|
      student[:favorites].include?(subject) ? score : 0
    end
    result[student[:name].to_sym] = total_grade
  end
end
