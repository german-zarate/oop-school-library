require './app'

class Main
  app = App.new

  puts 'Welcome to School Library App!'
  puts "\n"
  puts 'Please choose an option by entering a number:'

  loop do
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts "\n"

    option = gets.chomp

    case option
    when '1'
      # puts 'List all books'
      app.book_list
    when '2'
      puts 'List all people'
    when '3'
      puts 'Create a person'
    when '4'
      # puts 'Create a book'
      app.create_book
    when '5'
      puts 'Create a rental'
    when '6'
      puts 'List all rentals for a given person id'
    when '7'
      puts puts "Thank you for using this app!\n\n"
      break
    else
      puts 'Incorrect input, Please choose between 1 and 7'
    end
  end
end

Main
