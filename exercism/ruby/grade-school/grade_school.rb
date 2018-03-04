class School
  def initialize
    @students_by_grade = []
  end

  attr_reader :students_by_grade

  def add(student, number)
    index = @students_by_grade.index {|x| x[:grade] == number}
    if !index
      @students_by_grade << {grade: number, students: [student]}
      @students_by_grade.sort! {|grade1,grade2| grade1[:grade] <=> grade2[:grade]}
    else
      @students_by_grade[index][:students] << student
      @students_by_grade[index][:students].sort!
    end
  end

  def students(number)
    return @students_by_grade if @students_by_grade.empty?
    @students_by_grade.select {|x| x[:grade] == number}[0][:students]
  end
end

module BookKeeping
  VERSION = 3
end