require_relative "spec_helper"

describe Classroom do 
  before :each do 
    @classroom = Classroom.new(18)
  end
  
 it "Should have a instance" do
expect(@classroom).to be_instance_of Classroom
 end

 it "Should have a Class Number 18" do
  class_number = @classroom.label
  expect(class_number).to be (18)
   end

   it "Empty student initialize" do
    students_init = @classroom.students
    expect(students_init).to eql []
end
end

