require_relative '../classes/student.rb'
require_relative '../classes/teacher.rb'

class Persons
  MAIN_INPUT_MESSAGE = 'Enter an option number here --> '.freeze

  def initialize
    @persons = []
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

  def show_all_persons
    puts 'List of persons:'
    puts 'EMPTY' if @persons.empty?
    puts(@persons.map { |person| "[#{person.class}] - Name: #{person.name}, Age: #{person.age}, ID: #{person.id}" })
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
    puts 'Teacher created successfully!'
    puts
  end

end