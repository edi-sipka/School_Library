require_relative 'person'

class Student < Person 
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission, classroom = "Unknown")
    super(age, name,  parent_permission)
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