require './src/person'

class Student < Person
  attr_accessor :classroom

  def initialize(age = nil, name = 'Unknown', parent_permission: true, classroom: nil)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.students.include?(self)
  end
end
