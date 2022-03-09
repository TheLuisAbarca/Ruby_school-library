require_relative 'books'
require_relative 'persons'
require_relative 'rentals'
require_relative 'tui'
require_relative 'file_storage'

class App
  include Tui
  include FileStorage
  attr_reader :books, :persons, :rentals

  def initialize
    @books = Books.new
    @persons = Persons.new
    @rentals = Rentals.new
    clear_screen
    main_greeting_message
    # progress_bar
    read_from_json
  end

  def present_message
    print MAIN_PRESSENTER_MESSAGE
    gets
    puts
  end
end
