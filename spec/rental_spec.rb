require_relative 'spec_helper'

describe Rental do
  before :each do
    @book = Book.new('first book', 'mohammed')
    @person = Person.new(12, 'mohammed')
    @rental = Rental.new(18, @book, @person)
  end

  it 'Should have a instance' do
    expect(@rental).to be_instance_of Rental
  end

  it 'Should have to date of ' do
    date = @rental.date
    expect(date).to eql(18)
  end

  it 'Should have a book name of first book' do
    book_name = @book.title
    expect(book_name).to eq('first book')
  end

  it 'Should have an Name of mohammed' do
    person_name = @person.name
    expect(person_name).to eq('mohammed')
  end
end
