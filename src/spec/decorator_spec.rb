require_relative '../decorator'

describe Decorator do
  it 'correct_name should return the correct instance or nameable class' do
    person = Person.new(20, 'Albert Einstine')
    decorator = Decorator.new(person)
    expect(decorator.correct_name).to eq(person)
  end

  it 'correct_name should return the correct instance or nameable class' do
    student = Student.new(20, parent_permission: true)
    decorator = Decorator.new(student)
    expect(decorator.correct_name).to eq(student)
  end
end
