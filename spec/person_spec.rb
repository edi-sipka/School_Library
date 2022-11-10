require_relative 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(18, 'Edi')
  end

  it 'Should have a instance' do
    expect(@person).to be_instance_of Person
  end

  it 'Have an empty rentals' do
    rentals = @person.rentals
    expect(rentals).to eql []
  end

  it 'Should have an name Edi' do
    person_name = @person.name
    expect(person_name).to eq('Edi')
  end

  it 'Should have an age of 18' do
    person_age = @person.age
    expect(person_age).to eq(18)
  end

  it 'Can it use services' do
    services = @person.can_use_services?
    expect(services).to be_truthy
  end

  it 'Can not use services if person is younger than 18' do
    sample = Person.new(11, 'Mohammed')
    person_service = sample.can_use_services?
    expect(person_service).to be_falsy
  end
end
