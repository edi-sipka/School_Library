require_relative 'decorator'
require_relative 'person'

class CapitalizeDecorator < Decorator
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    super.capitalize
  end
end
