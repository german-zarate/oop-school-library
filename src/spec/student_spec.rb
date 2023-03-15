require_relative '../student'

age = 25
name = 'Shahadat Hossain'
parent_permission = true
classroom = 'First Class'

describe Student do
  before(:context) do
    @student = Student.new(name, age, parent_permission: parent_permission, classroom: classroom)
  end

  it 'it is a instance of Student class' do
    expect(@student).to be_instance_of(Student)
  end

  it 'Student name should be Shahadat Hossain' do
    expect(@student.name).to eq(name)
  end

  it 'Student age should be 25' do
    expect(@student.age).to eq(age)
  end

  it 'Student has parent permission' do
    expect(@student.parent_permission).to eq(parent_permission)
  end

  it 'Student has a class named First Class' do
    expect(@student.classroom).to eql(classroom)
  end
end
