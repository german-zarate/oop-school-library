
require_relative '../rental'
require_relative '../person'
require_relative '../book'


describe Classroom do
  before(:context) do
    @book = Book.new('book 1', 'author-1')
    @person = Person.new(25, 'Birhanu Gudisa', parent_permission:true)
    @date = Time.now
    @rental = Rental.new(@date, @person, @book)
  end

  it 'it is a instance of Rental class' do
    expect(@rental).to be_instance_of(Rental)
  end

  it 'Should return correct book title' do
    expect(@rental.book.title).to eq(@book.title)
  end

  it 'Should return correct author name' do
    expect(@rental.book.author).to eq(@book.author)
  end

  it 'Should return correct Rented person name' do
    expect(@rental.person.name).to eq(@person.name)
  end


end