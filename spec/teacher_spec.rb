require_relative 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new(25, 'Edi', 'Programmer')
  end

  it 'Should have a instance' do
    expect(@teacher).to be_instance_of Teacher
  end

  it 'Teacher can use services' do
    services = @teacher.can_use_services?
    expect(services).to be_truthy
  end

  it 'Checking correct specialization' do
    spec = @teacher.specialization
    expect(spec).to eql('Programmer')
  end

  it 'Checking teacher correct name' do
    name = @teacher.name
    expect(name).to eql('Edi')
  end
end
