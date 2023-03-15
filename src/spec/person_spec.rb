require_relative '../person'
require_relative '../nameable'

age = 25
name = 'someone'
parent_permission = true

describe Person do
  before(:context) do
    @person = Person.new(age, name, parent_permission:parent_permission)
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
end
