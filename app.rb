require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'classroom'



class App 
  attr_accessor :books, :rentals, :people
  
  def initialize 
    @books = []
    @rentals = []
    @people = []
  end

  def selected_option(option)
    case option 
    when "1"
      list_books
    when "2"
      list_people
    when "3"
      create_person 
    when "4"
      create_book
    when "5"
      puts "Five"
    when "6"
      puts "Six"
    else
      puts "Please select a valid option from the list!"
    end
end 

def list_books 
  @books.each do |book|
    puts book
  end
end

  def list_people 
    @people.each do |person|
      puts person
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
  puts "Book created successfully"
end
endANA