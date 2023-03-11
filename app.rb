require './book'
require './student'
require './teacher'

class App
  def initialize
    @books = []
    @people = []
    @rental = []
  end

  def book_list(is_printing_index: false)
    if @books.empty?
      puts 'book list is empty, try add a new book!'
    else
      @books.each_with_index do |book, index|
        if is_printing_index
          puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
        else
          puts "Title: \"#{book.title}\", Author: #{book.author}"
        end
      end
    end
    puts "\n"
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

  def person_list(is_printing_index: false)
    @people.each_with_index do |person, index|
      if is_printing_index
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      else
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    puts "\n"
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    num = gets.chomp
    if %w[1 2].include?(num)
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
    end

    case num
    when '1'
      student = create_student(name, age)
      @people.push(student)
    when '2'
      teacher = creat_teacher(name, age)
      @people.push(teacher)
    end
    puts "Person created successfully!\n\n"
  end

  def create_student(name, age)
    print 'Parent permisssion [y/n]:'
    permission = gets.chomp
    bool_permission = true
    bool_permission = false if %w[n N].include?(permission)
    print 'Enter classroom: '
    classroom = gets.chomp
    Student.new(name, age, parent_permission: bool_permission, classroom: classroom)
  end

  def creat_teacher(name, age)
    print 'Specialization:'
    specialization = gets.chomp
    Teacher.new(name, age, parent_permission: true, specialization: specialization)
  end

  def rental_list
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rental.each do |rent|
      puts "Date: #{rent.date}, Book \"#{rent.book.title}\" by #{rent.book.author}" if rent.person.id == id
    end
    puts "\n"
  end

  def create_rental
    if @books.empty?
      puts 'No books avilable, Add a new book.'
    elsif @people.empty?
      puts 'No person avilable, Add a new person.'
    else
      puts "\nSelect a book from the following list by number"
      book_list(is_printing_index: true)
      book_id = gets.chomp.to_i

      puts "\nSelect a person from the following list by number (not id)"
      person_list(is_printing_index: true)
      person_id = gets.chomp.to_i

      print "\nDate: "
      date = gets.chomp

      rent = Rental.new(date, @people[person_id], @books[book_id])
      @rental.push(rent)
      puts "Rental created successfully!\n\n"
    end
  end
end