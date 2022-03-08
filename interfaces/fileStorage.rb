require 'json'
module FileStorage
    BOOKS_FILE_PATH = './filestorage/books.json'.freeze
    PERSONS_FILE_PATH = './filestorage/persons.json'.freeze
    RENTALS_FILE_PATH = './filestorage/rentals.json'.freeze

    def save_json2files(books, persons, rentals)
        File.new(BOOKS_FILE_PATH, 'w') unless File.exist?(BOOKS_FILE_PATH)
        File.new(PERSONS_FILE_PATH, 'w') unless File.exist?(PERSONS_FILE_PATH)
        File.new(RENTALS_FILE_PATH, 'w') unless File.exist?(RENTALS_FILE_PATH)
        bks = []
        prsns = []
        rntls = []
        books.each do |book|
            b = { 'id' => book.id, 'title' => book.title, 'author' => book.author }
            bks << b
        end
        persons.each do |person|
            p = { 'id' => person.id, 'age' => person.age, 'name' => person.name, 'role' => person.role }
           if person.role == 'teacher'
              p['specialization'] = person.specialization
           else
              p['parent_permission'] = person.parent_permission
           end
          prsns << p
        end
        rentals.each do |rental|
            r = { 'date' => rental.date, 'book' => rental.book.id, 'person' => rental.person.id }
            rntls << r
        end

        # File.write(BOOKS_FILE_PATH, JSON.generate(books[0].author))
        File.write(BOOKS_FILE_PATH, JSON.generate(bks))
        File.write(PERSONS_FILE_PATH, JSON.generate(prsns))
        File.write(RENTALS_FILE_PATH, JSON.generate(rntls))
    end
end