require_relative '../teacher'

age = 25
name = 'Shahadat Hossain'
parent_permission = true
specialization = 'First specialization'

describe Teacher do
  before(:context) do
    @teacher = Teacher.new(name, age, parent_permission: parent_permission, specialization: specialization)
  end

  it 'it is a instance of Teacher class' do
    expect(@teacher).to be_instance_of(Teacher)
  end

  it 'Teacher name should be someone' do
    expect(@teacher.name).to eq(name)
  end

  it 'Teacher age should be 25' do
    expect(@teacher.age).to eq(age)
  end

  it 'Teacher has parent permission' do
    expect(@teacher.parent_permission).to eq(parent_permission)
  end

  it 'Teacher should have specialization named First specialization' do
    expect(@teacher.specialization).to eql(specialization)
  end
end
