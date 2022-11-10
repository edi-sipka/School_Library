require_relative 'spec_helper'

describe Decorator do
  context 'When testing the Decorator class' do
    it 'Should create a new instance of Decorator' do
      new_person = Person.new(18, 'Edi')
      expect(Decorator.new(new_person)).to be_instance_of(Decorator)
    end
  end
end
