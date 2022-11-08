require 'json'
require_relative 'book'

class Data

  def initialize
    @books = []
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

  # def load_books
  #   if File.exist?("./books.json")
  #     file = JSON.parse(File.open("./books.json"))
  #   else
  #     File.write("books.json", "r+")
  #   end
  # end

# def load_people
#   if File.exist?("./people.json")
#     file = JSON.parse(File.open("./people.json"))
#   else
#     File.write("people.json", "r+")
#   end
# end
#
# def load_rentals
#   if File.exist?("./rentals.json")
#     file = JSON.parse(File.open("./rentals.json"))
#   else
#     File.write("rentals.json", "r+")
#   end
# end
end