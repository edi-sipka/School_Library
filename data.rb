require 'json'
require_relative 'book'
require_relative "person"

class Data

  def initialize
    @books = []
    @person = []
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

      if person["type"] == "student"
        @person << Student.new(person['age'], person['name'], person['parent_permission'])
      elsif person ["type"] == "teacher"
        @person << Teacher.new(person['age'], person['name'], person['specialization']) 
      end 
    end
    @person
  end

  def create_person(person)
    if File.size?('./data/person.json')
      person_file = JSON.parse(File.read('./data/person.json'))

      if person.instance_of? Student 
       person_file << { name: person.name, age: person.age, parent_permission: person.parent_permission, type: "student"}
      elsif person.instance_of? Teacher 
        person_file << { name: person.name, age: person.age, specialization: person.specialization, type: "teacher"}
      end

      File.write('./data/person.json', JSON.pretty_generate(person_file))

    else
      if person.instance_of? Student 
        user_file = { name: person.name, age: person.age, parent_permission: person.parent_permission, type: "student"}
       elsif person.instance_of? Teacher 
         user_file = { name: person.name, age: person.age, specialization: person.specialization, type: "teacher"}
       end
      File.write('./data/person.json', JSON.pretty_generate([user_file]))
    end
  end
  



end