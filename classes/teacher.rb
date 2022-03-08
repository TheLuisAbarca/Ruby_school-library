require_relative 'person'

class Teacher < Person
  attr_reader :role, :specialization
  def initialize(age, name, specialization, id = rand(1..1000))
    super(age, name, true, id)
    @specialization = specialization
    @role = 'teacher'
  end

  def can_use_services?
    true
  end
end
