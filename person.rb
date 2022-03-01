class Person
  DEFAULT_BOOL = true

  def initialize(age, name = 'Unknown', parent_permission = DEFAULT_BOOL)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # Getters
  attr_reader :id

  attr_accessor :name, :age

  # Setters

  def can_use_services?
    isof_age? || @parent_permission
  end

  private

  def isof_age?
    age >= 18
  end
end
