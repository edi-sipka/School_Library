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
    create_rental
    when "6"
     list_rentals
    else
      puts "Please select a valid option from the list!"
    end
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
    print text 
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
        print text 
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
  puts "Book created successfully"
end 

def books_with_index
  @books.each_with_index do |book, index|
    text = "#{index}: "
    book.instance_variables.each do |var|
      val = book.instance_variable_get(var)
      var = var.to_s.delete('@')
      text += "#{var}:#{val} "
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
      text += "#{var}:#{val} "
    end
    puts text
  end
end

def create_rental
  puts 'Select a book from the following list by number'
  books_with_index
  selected_book = gets.chomp.to_i
  puts
  puts 'Select a person from the following list by number (not ID)'
  people_with_index
  selected_person = gets.chomp.to_i
  puts
  print 'Date: '
  date = gets.chomp
  rental = Rental.new(date, @books[selected_book], @people[selected_person])
  @rentals.push(rental)
  puts 'Rental created successfully'
end

def list_rentals
  @rentals.each do |rental|
    rental.instance_variables.each do |var|
     text = ""
     value = rental.instance_variable_get(var)
     var = var.to_s.delete("@")
     var = var.capitalize
     text += "#{var}:#{value} "
     print text 
   end
  end
 end
end