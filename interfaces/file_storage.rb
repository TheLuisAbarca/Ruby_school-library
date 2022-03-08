require_relative '../classes/book'
require_relative '../classes/student'
require_relative '../classes/teacher'
require_relative '../classes/rental'
require 'json'

module FileStorage
  BOOKS_FILE_PATH = './filestorage/books.json'.freeze
  PERSONS_FILE_PATH = './filestorage/persons.json'.freeze
  RENTALS_FILE_PATH = './filestorage/rentals.json'.freeze

  def save_json2files(books, persons, rentals)
    save_books(books) unless books.empty?
    save_persons(persons) unless persons.empty?
    save_rentals(rentals) unless rentals.empty?
  end

  def save_books(books)
    File.new(BOOKS_FILE_PATH, 'w') unless File.exist?(BOOKS_FILE_PATH)
    bks = []
    books.each do |book|
      b = { 'id' => book.id, 'title' => book.title, 'author' => book.author }
      bks << b
    end
    File.write(BOOKS_FILE_PATH, JSON.generate(bks))
  end

  def save_persons(persons)
    File.new(PERSONS_FILE_PATH, 'w') unless File.exist?(PERSONS_FILE_PATH)
    persons.each do |person|
      p = { 'id' => person.id, 'age' => person.age, 'name' => person.name, 'role' => person.role }
      if person.role == 'teacher'
        p['specialization'] = person.specialization
      else
        p['parent_permission'] = person.parent_permission
      end
      prsns << p
    end
    File.write(PERSONS_FILE_PATH, JSON.generate(prsns))
  end

  def save_rentals(rentals)
    File.new(RENTALS_FILE_PATH, 'w') unless File.exist?(RENTALS_FILE_PATH)
    rentals.each do |rental|
      r = { 'date' => rental.date, 'book' => rental.book.id, 'person' => rental.person.id }
      rntls << r
    end
    File.write(RENTALS_FILE_PATH, JSON.generate(rntls))
  end

  def read_from_json
    parse_books(File.read(BOOKS_FILE_PATH)) if File.exist?(BOOKS_FILE_PATH)
    parse_persons(File.read(PERSONS_FILE_PATH)) if File.exist?(PERSONS_FILE_PATH)
    parse_rentals(File.read(RENTALS_FILE_PATH)) if File.exist?(RENTALS_FILE_PATH)
  end

  def parse_books(books_json)
    return if books_json.empty?

    JSON.parse(books_json).each do |book|
      @books.add_book(Book.new(book['title'], book['author'], book['id']))
    end
  end

  def parse_persons(persons_json)
    return if persons_json.empty?

    JSON.parse(persons_json).each do |person|
      if person['role'] == 'student'
        @persons.add_person(Student.new(person['age'], person['name'], person['parent_permission'],
                                        person['id']))
      else
        @persons.add_person(Teacher.new(person['age'], person['name'], person['specialization'],
                                        person['id']))
      end
    end
  end

  def parse_rentals(rentals_json)
    return if rentals_json.empty?

    JSON.parse(rentals_json).each do |rental|
      book = @books.find_by_id(rental['book'])
      person = @persons.find_by_id(rental['person'])
      @rentals.add_rental(Rental.new(rental['date'], book, person))
    end
  end
end
