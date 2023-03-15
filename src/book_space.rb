require_relative 'book'

title = 'First Book'
author = 'First Author'

describe Book do
  before(:context) do
    @book = Book.new(title, author)
  end

  it 'it is a instance of book class' do
    expect(@book).to be_instance_of(Book)
  end

  it 'it has a title of First Book' do
    expect(@book.title).to eq(title)
  end

  it 'it has a author of First Author' do
    expect(@book.author).to eq(author)
  end
end
