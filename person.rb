require_relative 'nameable'

class Person < Nameable
  attr_accessor :name , :age, :rentals
  attr_reader :id 


  def initialize(age, parent_permission, name = 'Unknown')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age 
    @parent_permission = parent_permission
    @rentals = []
  end 

  def rent_book(date,book)
    Rental.new(date, book, self)
end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private 

  def of_age?
     @age >= 18
    end
end