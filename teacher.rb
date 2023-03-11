require './person'

class Teacher < Person
  def initialize(age = nil, name = 'Unknown', parent_permission: true, specialization: nil)
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
