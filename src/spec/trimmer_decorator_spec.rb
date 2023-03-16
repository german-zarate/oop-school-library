require_relative '../trimmer_decorator'
require_relative '../person'

describe TrimmerDecorator do
  it 'it should return name in caplitalize form' do
    person = Person.new(30, 'shahadat hossain')
    trimmed_person = TrimmerDecorator.new(person)
    expect(trimmed_person.correct_name).to eql('shahadat h')
  end
end
