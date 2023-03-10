require './book'

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
      @books.each_with_index do |book, index|
        puts "#{index} Title: #{book.title}, Author: #{book.author}"
      end
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
end
