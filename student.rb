require './person'

class Student < Person
  def initialize(name = 'Unknown', age = nil, parent_permission: true, classroom: nil)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
