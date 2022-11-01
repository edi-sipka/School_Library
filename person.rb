class Person 
  attr_reader :id , :name , :age
  attr_writer :name, :age

  def initialize(age, name = 'Unknown', parent_permission = "true")
    @id = Random.rand(1..1000)
    @name = name
    @age = age 
    @parent_permission = parent_permission
  end 

  def can_use_services?
    is_age? || @parent_permission
  end

  private 

  def is_age?
     @age >= 18
    end
end

