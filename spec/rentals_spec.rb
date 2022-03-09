require_relative 'require_helper'

RSpec.describe Rental do
  before :each do
    @book1 = Book.new('TLOTR', 'Tolkien')
    @book2 = Book.new('Harry Potter', 'J. K. Rowling')
    @student1 = Student.new(25, 'Luis', false)
    @teacher1 = Teacher.new(50, 'Mary', 'Literature')
    @rental1 = Rental.new('2022/03/09', @book1, @student1)
    @rental2 = Rental.new('2022/03/19', @book2, @teacher1)
  end

  it 'Takes two parameters and returns a Rental object' do
    expect(@rental1).to be_an_instance_of Rental
    expect(@rental2).to be_an_instance_of Rental
  end

  it 'Check title of the book' do
    expect(@rental1.book.title).to eql 'TLOTR'
    expect(@rental1.book.author).to eql 'Tolkien'
  end

  it 'Check author of the book' do
    expect(@rental2.person.name).to eql 'Mary'
  end

  it 'Check the number of rentals on a Person object' do
    expect(@student1.rentals.length).to eql 1
    expect(@teacher1.rentals.length).to eql 1
  end
end
