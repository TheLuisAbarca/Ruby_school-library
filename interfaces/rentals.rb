require_relative '../classes/rental'
require_relative 'tui'
# require 'pry'

class Rentals
  include Tui

  def initialize
    @rentals = []
  end

  def create_rental(books, persons)
    puts 'Select a book from the following list:'
    puts books.to_s
    # binding.pry
    books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    print MAIN_INPUT_MESSAGE
    book_index = gets.chomp.to_i
    puts
    puts 'Select a person form the following list:'
    persons.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
    print MAIN_INPUT_MESSAGE
    person_index = gets.chomp.to_i
    puts
    print 'Enter date of retrieval --> '
    date = gets.chomp
    @rentals << Rental.new(date, books[book_index], persons[person_index])
    puts 'Rental created successfully!'
    puts
  end

  def show_all_rentals(persons)
    print 'Enter the person\'s ID --> '
    person_id = gets.chomp.to_i
    renter = persons.select { |person| person.id == person_id }
    puts
    puts "Rentals of #{renter.first.name}:"
    puts 'EMPTY' if renter.first.rentals.empty?
    puts(renter.first.rentals.map { |rental| "Book: #{rental.book.title}, Rented on: #{rental.date}" })
    print MAIN_PRESSENTER_MESSAGE
    gets
    puts
  end
end
