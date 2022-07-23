require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def field(input)
    case input
    when '1'
      @app.list_books
      starting
    when '2'
      @app.list_persons
      starting
    when '3'
      @app.new_person
      starting
    when '4'
      @app.create_book
      starting
    when '5'
      @app.create_rental
      starting
    when '6'
      @app.list_rental_by_id
      starting
    when '7'
      puts 'Exit'
    else
      puts 'Sorry, Enter a number between 1 and 7 to chose an option'
      puts ' '
      starting
    end
  end

  def starting
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given id'
    puts '7 - Exit'
    num = gets.chomp
    field(num)
  end
end

main = Main.new
main.starting
