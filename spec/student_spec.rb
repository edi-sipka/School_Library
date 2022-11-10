require_relative 'spec_helper'

describe Student do
  before :each do
    @student = Student.new(21, 'Ahmed', true, '202')
  end

  it 'Checking Student instance variable' do
    expect(@student).to be_instance_of Student
  end

  it 'Checking Student classroom number' do
    class_number = @student.classroom
    expect(class_number).to eql('202')
  end

  it 'Checking Student name' do
    student_name = @student.name
    expect(student_name).to eql('Ahmed')
  end

  it 'Can use play_hooky service' do
    service = @student.play_hooky
    expect(service).to eql('¯\(ツ)/¯')
  end
end
