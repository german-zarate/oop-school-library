require_relative '../capitalize_decorator'
require_relative '../person'

describe CapitalizeDecorator do
  it 'it should return name in caplitalize form' do
    person = Person.new(30, 'shahadat hossain')
    capitalize_person = CapitalizeDecorator.new(person)
    expect(capitalize_person.correct_name).to eql('Shahadat hossain')
  end
end
