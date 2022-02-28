require_relative 'person'

class Student < Person
  def initialize(age, name, classroom, parent_permission = DEFAULT_BOOL)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '"¯\(ツ)/¯"'
  end
end
