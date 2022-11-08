require_relative 'person'

class Student < Person 
  attr_accessor :classroom

  def initialize(age, parent_permission, name, classroom = 'Unknown')  
    super(age,parent_permission,name)
    @classroom = classroom
end

def add_classroom(classroom)
  @classroom = classroom 
  classroom.students.push(self) unless classroom.students.include?(self)
end

def play_hooky
  '¯\(ツ)/¯'
 end
end