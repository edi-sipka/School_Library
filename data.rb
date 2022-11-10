require 'json'
require_relative 'book'
require_relative 'person'
require_relative 'rental'

class Data
  def initialize
    @books = []
    @person = []
    @rentals = []
  end

  def load_books
    return unless File.size?('./data/books.json')

    stored_books = JSON.parse(File.read('./data/books.json'))
    stored_books.map do |book|
      @books << Book.new(book['title'], book['author'])
    end
    @books
  end

  def create_book(book)
    if File.size?('./data/books.json')
      books_file = JSON.parse(File.read('./data/books.json'))
      books_file << { title: book.title, author: book.author }
      File.write('./data/books.json', JSON.pretty_generate(books_file))
    else
      File.write('./data/books.json', JSON.pretty_generate([{ title: book.title, author: book.author }]))
    end
  end

  def load_person
    return unless File.size?('./data/person.json')

    stored_person = JSON.parse(File.read('./data/person.json'))
    stored_person.map do |person|
      case person['type']
      when 'student'
        @person << Student.new(person['age'], person['name'], person['parent_permission'], id: person['id'])
      when 'teacher'
        @person << Teacher.new(person['age'], person['name'], person['specialization'], id: person['id'])
      end
    end
    @person
  end

  def create_person(person)
    if File.size?('./data/person.json')
      person_file = JSON.parse(File.read('./data/person.json'))
      if person.instance_of? Student
        person_file << { name: person.name, age: person.age, parent_permission: person.parent_permission,
                         type: 'student', id: person.id }
      else
        person.instance_of? Teacher
        person_file << { name: person.name, age: person.age, specialization: person.specialization, type: 'teacher',
                         id: person.id }
      end
      File.write('./data/person.json', JSON.pretty_generate(person_file))

    else
      if person.instance_of? Student
        user_file = { name: person.name, age: person.age, parent_permission: person.parent_permission, type: 'student',
                      id: person.id }
      else
        person.instance_of? Teacher
        user_file = { name: person.name, age: person.age, specialization: person.specialization, type: 'teacher',
                      id: person.id }
      end
      File.write('./data/person.json', JSON.pretty_generate([user_file]))
    end
  end

  def load_rentals
    return [] unless File.size?('./data/rentals.json')

    stored_rentals = JSON.parse(File.read('./data/rentals.json'))
    stored_rentals.map do |rental|
      person_id = rental['person']['id']
      find_person = @person.find { |person| person_id == person.id }
      book_title = rental['book']['title']
      find_book = @books.find { |book| book_title == book.title }
      @rentals << Rental.new(rental['date'], find_book, find_person)
    end
    @rentals
  end

  def create_rental(rental)
    if File.size?('./data/rentals.json')
      rentals_file = JSON.parse(File.read('./data/rentals.json'))
      rentals_file << { date: rental.date, book: {
        title: rental.book.title,
        author: rental.book.author
      }, person: {
        name: rental.person.name,
        age: rental.person.age,
        id: rental.person.id
      } }
      File.write('./data/rentals.json', JSON.pretty_generate(rentals_file))
    else
      File.write('./data/rentals.json',
                 JSON.pretty_generate([date: rental.date, book: {
                                        title: rental.book.title,
                                        author: rental.book.author
                                      }, person: {
                                        name: rental.person.name,
                                        age: rental.person.age,
                                        id: rental.person.id
                                      }]))
    end
  end

  def save_data(books, person, rentals)
    File.write('./data/rentals.json', JSON.pretty_generate(rentals)) if rentals.any?
    File.write('./data/books.json', JSON.pretty_generate(books)) if books.any?
    File.write('./data/person.json', JSON.pretty_generate(person)) if person.any?
  end
end
