require_relative '../nameable'

describe Nameable do
  it 'correct_name should raise an erro' do
    nameable = Nameable.new
    expect { nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
