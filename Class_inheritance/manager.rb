require_relative "employee"

class Manager < Employee
  attr_reader :employees, :name
  attr_writer :employees

  def initialize(name, title, salary, boss)
    @employees = []
    super(name, title, salary, boss)
  end
end 

if $PROGRAM_NAME == __FILE__
  manager1 = Manager.new("Joe", "manager", 1000, "CEO")
  employee1 = Employee.new("Jane", "worker", 500, "Joe")
  manager2 = Manager.new("Chris", "manager", 1000, "Joe")
  employee2 = Employee.new("John", "worker", 600, "Chris") 
  manager1.employees << employee1
  manager1.employees << manager2
  manager2.employees << employee2

  #p manager1.bonus(2)
  p employee1.bonus(2)

  
end

