require_relative 'corrector'
require_relative 'rental'

class Person
  DEFAULT_BOOL = true

  def initialize(age, name = 'Unknown', parent_permission = DEFAULT_BOOL, id = rand(1..1000))
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  # Getters
  attr_reader :id, :rentals, :parent_permission

  attr_accessor :name, :age

  # Setters

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def rent(date, book)
    Rental.new(date, book, self)
  end

  private

  def is_of_age?
    age >= 18
  end
end
