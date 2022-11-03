require_relative "book"
require_relative "classroom"
require_relative "student"
require_relative "teacher"


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
      puts "Three"
    when "4"
      puts "Four"
    when "5"
      puts "Five"
    when "6"
      puts "Six"
    end
end 

def list_books 
  @books.each do |book|
    puts book
  end

  def list_people 
    @people.each do |person|
      puts person
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
      student = Student.new (age, name, parent_permission)
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
  teacher = Teacher.new (specialization, age, name)
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


end


    