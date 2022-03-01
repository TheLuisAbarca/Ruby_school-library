require_relative 'corrector'

class Person
  DEFAULT_BOOL = true

  def initialize(age, name = 'Unknown', parent_permission = DEFAULT_BOOL)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
  end

  # Getters
  attr_reader :id

  attr_accessor :name, :age

  # Setters

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private

  def is_of_age?
    age >= 18
  end
end
