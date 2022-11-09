require_relative 'select'

class Main
  def choose_option
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def start
    select = Select.new
    puts 'Welcome to School Library App!'
    loop do
      choose_option
      option = gets.chomp
      break if option == '7'

      select.selected_option(option)
    end
  end
end

main = Main.new
main.start
