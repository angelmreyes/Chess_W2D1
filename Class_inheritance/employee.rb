require "byebug"

class Employee 
  attr_reader :title, :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    #debugger
    
    if self.title != "manager"
      bono = (self.salary) * multiplier
    else
      bono_sum = 0
      self.employees.each do |employee|
        bono_sum += employee.bonus(multiplier)
      end
      bono_sum -= self.salary
      bono_sum += self.salary * multiplier
    end
  end
end 