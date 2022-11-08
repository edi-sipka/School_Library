require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'classroom'
require_relative 'person'
require_relative 'data'

class App 
  attr_accessor :books, :rentals, :people
  
  def initialize
    @data = Data.new
    @books = @data.load_books
    @rentals = []
    @people = []
  end

def list_books 
  @books.each do |book|
   book.instance_variables.each do |var|
    text = ""
    value = book.instance_variable_get(var)
    var = var.to_s.delete("@")
    var = var.capitalize
    unless var.include?("Rentals")
    text += "#{var}:#{value} "
  end
    puts text 
  end
 end
end

  def list_people 
    @people.each do |person|
      person.instance_variables.each do |var|
        text = ""
        value = person.instance_variable_get(var)
        var = var.to_s.delete("@")
        var = var.capitalize
        unless var.include?("Rentals") or var.include?("Classroom")
          text += "#{var}:#{value} "
        end
        puts text 
      end
    end
  end


    def create_person 
      puts "Do you want to create a student(1) or a teacher(2)?"
      choise = gets.chomp
      
      if choise == "1"
        create_student 
      elsif choise == "2"
        create_teacher
      else
        puts "Your input is wrong!"
      end
    end

    def create_student
      puts "Age:"
      age = gets.chomp
      puts "Name:"
      name = gets.chomp 
      puts "Has parent permission? [Y/N]"
      parent_permission = gets.chomp.upcase == "Y"
      student = Student.new(age, parent_permission, name, "Unknown")
      @people.push(student)
      puts "You added student successfully"
     end

def create_teacher
  puts "Age:"
  age = gets.chomp
  puts "Name:"
  name = gets.chomp 
  puts "Specialization:"
  specialization = gets.chomp
  teacher = Teacher.new(age, name, specialization)
  @people.push(teacher)
  puts "You added teacher successfully"
end

def create_book
  puts "Title:"
  title = gets.chomp
  puts "Author:"
  author = gets.chomp 
  book = Book.new(title, author)
  @books.push(book)
  @data.create_book(book)
  puts "Book created successfully"
end 

def books_with_index
  @books.each_with_index do |book, index|
    text = "#{index}: "
    book.instance_variables.each do |var|
      val = book.instance_variable_get(var)
      var = var.to_s.delete('@')
      unless var.include?("rentals") or var.include?("classroom")
      text += "#{var}:#{val} "
    end
  end
    puts text
  end
end

def people_with_index
  @people.each_with_index do |person, index|
    text = "#{index}: "
    person.instance_variables.each do |var|
      val = person.instance_variable_get(var)
      var = var.to_s.delete('@')
      unless var.include?("rentals") or var.include?("classroom")
      text += "#{var}:#{val} "
    end
  end
    puts text
  end
end

def create_rental
  puts 'Select a book from the following list by number'
  books_with_index
  selected_book = gets.chomp.to_i
  puts 'Select a person from the following list by number (not ID)'
  people_with_index
  selected_person = gets.chomp.to_i
  print 'Date: '
  date = gets.chomp
  book = @books[selected_book]
  person = @people[selected_person]
  rental = Rental.new(date, book, person)
  @rentals.push(rental)
  puts 'Rental created successfully'
end

def list_rentals
  print 'To see person rentals enter the person ID: '
  id = gets.chomp.to_i
  puts 'Rented Books:'
  @rentals.each do |rental|
    person = rental.instance_variable_get(:@person)
    person_id = person.instance_variable_get(:@id)

    if person_id == id
   book = rental.instance_variable_get(:@book)
   title = book.instance_variable_get(:@title)
   author = book.instance_variable_get(:@author)
  puts "Date: #{rental.date} Book: #{title} by Author: #{author} "

end
 end
  end
   end


