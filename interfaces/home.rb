require_relative 'books'
require_relative 'persons'
require_relative 'rentals'
require_relative 'tui'

class App
  MAIN_INPUT_MESSAGE = 'Enter an option number here --> '.freeze
  MAIN_PRESSENTER_MESSAGE = 'Press ENTER to continue'.freeze 
  include Tui

  def initialize
    @options_answer = 0
    @books = Books.new
    @persons = Persons.new
    clear_screen
    main_greeting_message
    progress_bar
    #@rentals = Rentals.new

  end

  def show_main_options
    clear_screen
    menu = "Please choose an option by entering a number:\n"\
    "1 - List all books\n"\
    "2 - List all people\n"\
    "3 - Create a person\n"\
    "4 - Create a book\n"\
    "5 - Create a rental\n"\
    "6 - List all rentals for a given person ID\n"\
    "7 - Exit\n"
    print menu
    print MAIN_INPUT_MESSAGE
  end

  def option_selected
    case @options_answer
    when 1
      @books.show_all_books
      print MAIN_PRESSENTER_MESSAGE
      gets
      puts
    when 2
      @persons.show_all_persons
      print MAIN_PRESSENTER_MESSAGE
      gets
      puts
    when 3
      @persons.create_person

    when 4
      @books.create_book
    when 5
      #create_rental
    when 6
      #show_all_rentals
    else
      puts 'Exiting session'
      loading_effect
      clear_screen
      exit_greeting_message
      loading_effect
      clear_screen
    end
  end

  def main
    until @options_answer == 7
      show_main_options
      @options_answer = gets.chomp.to_i
      puts
      option_selected
    end
  end

  def create_rental
    puts 'Select a book from the following list:'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    print MAIN_INPUT_MESSAGE
    book_index = gets.chomp.to_i
    puts
    puts 'Select a person form the following list:'
    @persons.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
    print MAIN_INPUT_MESSAGE
    person_index = gets.chomp.to_i
    puts
    print 'Enter date of retrieval --> '
    date = gets.chomp
    Rental.new(date, @books[book_index], @persons[person_index])
    puts 'Rental created successfully!'
    puts
  end

  def show_all_rentals
    print 'Enter the person\'s ID --> '
    person_id = gets.chomp.to_i
    renter = @persons.select { |person| person.id == person_id }
    puts
    puts "Rentals of #{renter.first.name}:"
    puts 'EMPTY' if renter.first.rentals.empty?
    puts(renter.first.rentals.map { |rental| "Book: #{rental.book.title}, Rented on: #{rental.date}" })
    print MAIN_PRESSENTER_MESSAGE
    gets
    puts
  end


end
