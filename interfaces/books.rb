require_relative '../classes/book'

class Books
  attr_reader :books

  def initialize
    @books = []
    @books << Book.new('The Hobbit', 'J.R.R. Tolkien')
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

  def show_all_books
    puts 'List of books:'
    puts 'EMPTY' if @books.empty?
    puts(@books.map { |book| "Title: #{book.title}, Author: #{book.author}" })
  end
end
