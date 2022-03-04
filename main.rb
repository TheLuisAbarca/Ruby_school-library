require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require 'os'

class App
  MAIN_INPUT_MESSAGE = 'Enter an option number here --> '.freeze
  MAIN_PRESSENTER_MESSAGE = 'Press ENTER to continue'.freeze

  def initialize
    @options_answer = 0
    @book = []
    @persons = []

    clear_screen
    main_greeting_message
    progress_bar
    # loading_effect
  end

  def clear_screen
    system('cls') if OS.windows?
    system('clear') if OS.posix?
  end

  def loading_effect
    system('timeout 5') if OS.windows?
    system('sleep 5') if OS.posix?
  end

  def progress_bar
    loading = 'Loading System ['
    1000.times do |i|
      j = i + 1
      next unless (j % 10).zero?

      loading << '='
      print "\r"
      print loading + " #{j / 10} %" if j / 10 != 100
      print loading + " #{j / 10} %]" if j / 10 == 100
      $stdout.flush
      sleep 0.05
      print "\r"
    end
    puts
  end

  # 100.times {|p| print "\rDownloading %#{p+1}..."; sleep 1}

  def main_greeting_message
    puts ' ____       _                 _   _     _ _                          '
    puts '/ ___|  ___| |__   ___   ___ | | | |   (_) |__  _ __ __ _ _ __ _   _ '
    puts '\___ \ / __| \'_ \ / _ \ / _ \| | | |   | | \'_ \| \'__/ _` | \'__| | | |'
    puts ' ___) | (__| | | | (_) | (_) | | | |___| | |_) | | | (_| | |  | |_| |'
    puts '|____/ \___|_| |_|\___/ \___/|_| |_____|_|_.__/|_|  \__,_|_|   \__, |'
    puts '                                                               |___/ '

    puts '                 ____            _                 '
    puts '                / ___| _   _ ___| |_ ___ _ __ ___  '
    puts '                \___ \| | | / __| __/ _ \ \'_ ` _ \ '
    puts '                 ___) | |_| \__ \ ||  __/ | | | | |'
    puts '                |____/ \__, |___/\__\___|_| |_| |_|'
    puts '                       |___/                       '
  end

  def exit_greeting_message
    clear_screen

    puts ' _____ _                 _                           __            '
    puts '|_   _| |__   __ _ _ __ | | __  _   _  ___  _   _   / _| ___  _ __ '
    puts '  | | | \'_ \ / _` | \'_ \| |/ / | | | |/ _ \| | | | | |_ / _ \| \'__|'
    puts '  | | | | | | (_| | | | |   <  | |_| | (_) | |_| | |  _| (_) | |   '
    puts '  |_| |_| |_|\__,_|_| |_|_|\_\  \__, |\___/ \__,_| |_|  \___/|_|   '
    puts '                                |___/                              '
    puts
    puts '                                 _             '
    puts '                       _   _ ___(_)_ __   __ _ '
    puts '                      | | | / __| | \'_ \ / _` |'
    puts '                      | |_| \__ \ | | | | (_| |'
    puts '                       \__,_|___/_|_| |_|\__, |'
    puts '                                         |___/ '

    puts
    main_greeting_message
  end

  def show_main_options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person ID'
    puts '7 - Exit'
    print MAIN_INPUT_MESSAGE
  end

  def option_selected
    case @options_answer
    when 1
      show_all_books
    when 2
      show_all_persons
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      show_all_rentals
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

  def show_all_books
    puts 'List of books:'
    puts 'EMPTY' if @books.empty?
    puts(@books.map { |book| "Title: #{book.title}, Author: #{book.author}" })
    print MAIN_PRESSENTER_MESSAGE
    gets
    puts
  end

  def show_all_persons
    puts 'List of persons:'
    puts 'EMPTY' if @persons.empty?
    puts(@persons.map { |person| "[#{person.class}] - Name: #{person.name}, Age: #{person.age}, ID: #{person.id}" })
    print MAIN_PRESSENTER_MESSAGE
    gets
    puts
  end

  def create_person
    puts 'Do you want to create a student (1), or a teacher (2)? [Press or Input the number]:'
    print MAIN_INPUT_MESSAGE
    case gets.chomp.to_i
    when 1
      create_student
    when 2
      create_teacher
    else
      puts
      puts 'Invalid option choosed, please choose one that is listed.'
      puts
      create_person
    end
    puts
  end

  def create_book
    puts 'Please, enter book information below:'
    print 'Title --> '
    title = gets.chomp
    print 'Author --> '
    author = gets.chomp
    @books << Book.new(title, author)
    puts
    puts 'Book created successfully!'
    puts
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

  private

  def create_student
    print 'Age --> '
    age = gets.chomp.to_i
    print 'Name --> '
    name = gets.chomp
    print 'Has parent permission? [Y/N] --> '
    permission = gets.chomp.upcase
    permission = permission != 'N'
    @persons << Student.new(age, name, permission)
    puts 'Student created successfully!'
    puts
  end

  def create_teacher
    print 'Age --> '
    age = gets.chomp.to_i
    print 'Name --> '
    name = gets.chomp
    print 'Specialty --> '
    specialty = gets.chomp
    @persons << Teacher.new(age, name, specialty)
    puts
    puts 'Teacher created successfully!'
    puts
  end
end

App.new.main
