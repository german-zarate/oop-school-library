require './book'
require './student'
require './teacher'

class App
  def initialize
    @books = []
    @people = []
    @rental = []
  end

  def book_list
    if @books.empty?
      puts 'book list is empty, try add a new book!'
    else
      @books.each_with_index do |book, _index|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
      puts "\n"
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully!'
    puts "\n"
  end

  def person_list
    @people.each_with_index do |person, _index|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts "\n"
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    num = gets.chomp
    case num
    when '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Parent permisssion [y/n]:'
      permission = gets.chomp
      bool_permission = true
      bool_permission = false if %w[n N].include?(permission)
      print 'Enter classroom: '
      classroom = gets.chomp
      Student.new(name, age, parent_permission: bool_permission, classroom: classroom)
      @people.push(student)
      puts "Person created successfully!\n\n"
    end
  end
end
