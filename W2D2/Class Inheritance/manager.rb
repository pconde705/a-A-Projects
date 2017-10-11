require_relative 'employee'

class Manager < Employee

  attr_accessor :employees, :boss
  def initialize(name, salary, boss = nil)
    super(name, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    money = []
    @employees.each do |emp|
      p self.name
      p emp.class
      if emp.class.is_a? Manager
        p true
        emp.employees.each do |em|
          money << em.salary
        end
      end
      money << emp.salary
    end
    money.reduce(:+) * multiplier
  end
end

ned = Manager.new("Ned", 1000000)
darren = Manager.new("Darren", 78000, ned)
shawna = Employee.new("Shawna", 12000, darren)
david = Employee.new("David", 10000, darren)
# p darren.employees
# p ned.employees

# p "-----------------------"
#

p ned.bonus(5) # => 500_000
darren.bonus(4) # => 88_000
david.bonus(3) # => 30_000
