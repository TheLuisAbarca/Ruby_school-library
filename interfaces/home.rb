require_relative 'books'
require_relative 'persons'
require_relative 'rentals'
require_relative 'tui'

class App
  include Tui

  def initialize
    @options_answer = 0
    @books = Books.new
    @persons = Persons.new
    @rentals = Rentals.new
    clear_screen
    main_greeting_message
    progress_bar
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
      @rentals.create_rental(@books.books, @persons.persons)
    when 6
      @rentals.show_all_rentals(@persons.persons)
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
end
