require_relative 'person'

class Teacher < Person
  attr_reader :role, :specialization
  def initialize(age, name, specialization)
    super(age, name)
    @specialization = specialization
    @role = 'teacher'
  end

  def can_use_services?
    true
  end
end
