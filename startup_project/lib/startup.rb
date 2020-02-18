require "employee"

class Startup
  
  attr_reader :name, :funding, :salaries, :employees
  
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end
  
  def valid_title?(title)
    @salaries.has_key?(title)
  end
  
  def >(startup)
    @funding > startup.funding
  end
  
  def hire(employee_name, title)
    if valid_title?(title)
      @employees << Employee.new(employee_name, title)
    else
      raise 'title invalid'
    end
  end
  
  def size
    @employees.length
  end
  
  def pay_employee(employee)
    salary = @salaries[employee.title]
    
    if @funding >= salary
      employee.pay(salary)
      @funding -= salary
    else
      raise 'not enough funding'
    end
  end
  
  def payday
    @employees.each { |employee| pay_employee(employee) }
  end
  
  def average_salary
    total_salaries = 0
    
    @employees.each { |employee| total_salaries += @salaries[employee.title] }
    
    total_salaries / @employees.length
  end
  
  def close
    @employees = []
    @funding = 0
  end
  
  def acquire(startup)
    @funding += startup.funding
    
    startup.salaries.each do |title, salary|
      if not @salaries.has_key?(title)
        @salaries[title] = salary
      end
    end
    
    startup.employees.each { |employee| @employees << employee }
    startup.close
  end
  
end
