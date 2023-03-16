require_relative '../person'
require_relative '../nameable'

age = 25
name = 'someone'
parent_permission = true

describe Person do
  before(:context) do
    @person = Person.new(age, name, parent_permission: parent_permission)
  end

  it 'it is a instance of Person class' do
    expect(@person).to be_instance_of(Person)
  end

  it 'Person name should be someone' do
    expect(@person.name).to eq(name)
  end

  it 'Person age should be 25' do
    expect(@person.age).to eq(age)
  end

  it 'Person has parent permission' do
    expect(@person.parent_permission).to eq(parent_permission)
  end

  it 'Person correct_name method should return correctly' do
    expect(@person.correct_name).to eql(name)
  end

  it 'Person of_age? method should return the value correctly' do
    expect(@person.send(:of_age?)).to eq(true)
  end

  it 'can_use_service should return correctly' do
    expect(@person.can_use_services?).to be true
  end

  it 'add_rental method should add rental correctly' do
    book = Book.new('book 1', 'author1')
    new_rental = Rental.new(Time.new, @person, book)
    @person.add_rental(new_rental)
    expect(@person.rentals.include?(new_rental)).to be true
  end
end
