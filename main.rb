require_relative './interfaces/home'
require_relative './interfaces/tui'
require_relative './interfaces/file_storage'

def main
  @app = App.new
  @options_answer = 0

  show_main_options = lambda do
    include Tui
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

  option_selected = lambda do
    include Tui
    case @options_answer
    when 1
      @app.books.show_all_books
      @app.present_message
    when 2
      @app.persons.show_all_persons
      @app.present_message
    when 3
      @app.persons.create_person
    when 4
      @app.books.create_book
    when 5
      @app.rentals.create_rental(@app.books.books, @app.persons.persons)
    when 6
      @app.rentals.show_all_rentals(@app.persons.persons)
    else
      puts 'Exiting session'
      save_json2files(@app.books.books, @app.persons.persons, @app.rentals.rentals)
      loading_effect
    end
  end

  main_screen = lambda do
    include Tui
    include FileStorage
    until @options_answer == 7
      show_main_options.call
      @options_answer = gets.chomp.to_i
      puts
      option_selected.call
    end
  end

  main_screen.call
end

main
