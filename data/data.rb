require_relative "./books.json"
require_relative "./people.json"
require_relative "./rentals.json"
require "json"


class Data
  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

def load_books
  if File.exist?("./books.json")
    file = JSON.parse(File.open("./books.json"))
  else 
    File.write("books.json", "r+")
  end
end

def save_books 
  @books.
end

def load_people
  if File.exist?("./people.json")
    file = JSON.parse(File.open("./people.json"))
  else 
    File.write("people.json", "r+")
  end
end

def load_rentals
  if File.exist?("./rentals.json")
    file = JSON.parse(File.open("./rentals.json"))
  else 
    File.write("rentals.json", "r+")
  end
end
end