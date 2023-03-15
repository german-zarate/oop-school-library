require_relative '../classroom'
require_relative '../student'

label = 'section-2'

describe Classroom do
  before(:context) do
    @classroom = Classroom.new(label)
  end

  it 'it is a instance of Classroom class' do
    expect(@classroom).to be_instance_of(Classroom)
  end

  it 'class label @classroom should be section-2' do
    expect(@classroom.label).to eq(label)
  end

  it 'It should return correct number of student in a classroom' do
    stud1 = Student.new('student 1', 20, parent_permission: true, classroom: @classroom)
    @classroom.add_student(stud1)
    stud2 = Student.new('student 2', 22, parent_permission: false, classroom: @classroom)
    @classroom.add_student(stud2)
    stud3 = Student.new('student 3', 20, parent_permission: true, classroom: @classroom)
    @classroom.add_student(stud3)

    expect(@classroom.students.length).to eq(3)
  end
end
