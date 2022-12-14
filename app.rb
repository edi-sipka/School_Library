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
    @people = @data.load_person
    @rentals = @data.load_rentals
  end

  def list_books
    @books.each do |book|
      book.instance_variables.each do |var|
        text = ''
        value = book.instance_variable_get(var)
        var = var.to_s.delete('@')
        var = var.capitalize
        text += "#{var}:#{value} " unless var.include?('Rentals')
        puts text
      end
    end
  end

  def list_people
    @people.each do |person|
      person.instance_variables.each do |var|
        text = ''
        value = person.instance_variable_get(var)
        var = var.to_s.delete('@')
        var = var.capitalize
        text += "#{var}:#{value} " unless var.include?('Rentals') or var.include?('Classroom')
        puts text
      end
    end
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)?'
    choise = gets.chomp

    case choise
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Your input is wrong!'
    end
  end

  def create_student
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp.upcase == 'Y'
    id = Random.rand(1..1000)
    student = Student.new(age, name, parent_permission, 'Unknown', id: id)
    @people.push(student)
    @data.create_person(student)
    puts 'You added student successfully'
  end

  def create_teacher
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    id = Random.rand(1..1000)
    teacher = Teacher.new(age, name, specialization, id: id)
    @people.push(teacher)
    @data.create_person(teacher)
    puts 'You added teacher successfully'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    @data.create_book(book)
    puts 'Book created successfully'
  end

  def books_with_index
    @books.each_with_index do |book, index|
      text = "#{index}: "
      book.instance_variables.each do |var|
        val = book.instance_variable_get(var)
        var = var.to_s.delete('@')
        text += "#{var}:#{val} " unless var.include?('rentals') or var.include?('classroom')
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
        text += "#{var}:#{val} " unless var.include?('rentals') or var.include?('classroom')
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
    @data.create_rental(rental)
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'To see person rentals enter the person ID: '
    id = gets.chomp.to_i
    puts 'Rented Books:'
    @rentals.each do |rental|
      person = rental.instance_variable_get(:@person)
      person_id = person.instance_variable_get(:@id)

      next unless person_id == id

      book = rental.instance_variable_get(:@book)
      title = book.instance_variable_get(:@title)
      author = book.instance_variable_get(:@author)
      puts "Date: #{rental.date} Book: #{title} by Author: #{author} "
    end
  end
end
