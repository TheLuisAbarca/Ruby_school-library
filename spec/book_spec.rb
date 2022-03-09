require_relative 'require_helper'

RSpec.describe Book do
  before :each do
    @book = Book.new('TLOTR', 'Tolkien')
  end

  it 'Takes two parameters and returns a Book object' do
    expect(@book).to be_an_instance_of Book
  end

  it 'Check title of the book' do
    expect(@book.title).to eql 'TLOTR'
  end

  it 'Check author of the book' do
    expect(@book.author).to eql 'Tolkien'
  end
end
