require_relative 'person'

class Student < Person
  def initialize(age, name, parent_permission = DEFAULT_BOOL, id = rand(1..1000))
    super(age, name, parent_permission, id)
    @role = 'student'
  end

  attr_reader :classroom, :role

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '"¯\(ツ)/¯"'
  end
end
