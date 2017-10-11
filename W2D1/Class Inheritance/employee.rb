class Employee

  attr_accessor :name, :salary
  attr_reader :boss

  def initialize(name, salary, boss = nil)
    @name = name
    @title
    @salary = salary
    @boss = boss
    add_to_emp_list
  end

  def add_to_emp_list
    boss.employees << self unless boss.nil?
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end
