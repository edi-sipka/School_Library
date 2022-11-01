require_relative 'person'

class Student < Person 
  attr_reader :classroom

  def initialize(id, name = 'Unknown', classroom, age, parent_permission: true)
    super(id, name, age, parent_permission)
    @classroom = classroom
end

def play_hooky
  '¯\(ツ)/¯'
 end
end