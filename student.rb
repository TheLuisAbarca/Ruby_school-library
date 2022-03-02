require_relative 'person'

class Student < Person
  def initialize(age, name, parent_permission = DEFAULT_BOOL)
    super(age, name, parent_permission)
  end

  attr_accessor :classroom

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '"¯\(ツ)/¯"'
  end
end
