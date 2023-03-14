require './src/book'
require './src/student'
require './src/teacher'
require './src/handle_data'

class App
  def initialize
    @books = []
    @people = []
    @rental = []
    @books_data = HandleData.new('books')
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
      age = add_person_age
      name = add_person_name
    end

    created_person = nil
    case num
    when '1'
      created_person = create_student(name, age)
    when '2'
      created_person = creat_teacher(name, age)
    end
    @people.push(created_person)
    puts "Person created successfully!\n\n"
    created_person
  end

  def add_person_age
    age = 0
    temp = false
    until temp
      print 'Age: '
      age = gets.chomp.to_i
      puts 'Enter a valid number' unless age.positive?
      temp = age.positive?
    end
    age
  end

  def add_person_name
    name = ''
    checking = false
    until checking
      print 'Name: '
      name = gets.chomp
      puts 'Enter a valid name' if name.to_i <= 0
      checking = !name.to_i.positive?
    end
    name
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

  def save_files
    generated_books = @books.map do |book|
      [
        book.title,
        book.author
      ]
    end
    @books_data.write(generated_books)
  end
end
