require './src/rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rented_by(date, person)
    Rental.new(date, self, person)
  end
end
