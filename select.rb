require_relative 'app'

class Select
  def initialize
    @app = App.new
  end

  def selected_option(option)
    case option
    when '1'
      @app.list_books
    when '2'
      @app.list_people
    when '3'
      @app.create_person
    when '4'
      @app.create_book
    when '5'
      @app.create_rental
    when '6'
      @app.list_rentals
    else
      puts 'Please select a valid option from the list!'
    end
  end
end
