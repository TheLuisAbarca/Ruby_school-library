require_relative 'rental'

class Book
  def initialize(title, author, id = rand(1..1000))
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  attr_reader :id
  attr_accessor :title, :author, :rentals

  def rent(date, person)
    Rental.new(date, self, person)
  end
end
