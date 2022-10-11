require "employee"

class Startup
    def initialize(name,funding,salaries)
        @name = name
        @funding = funding
        @employees = []
        @salaries = {}
        
        salaries.each do |k,v|
            @salaries[k] = v
        end
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        @salaries.include?(title)
    end

    def >(startup)
        @funding > startup.funding
    end

    def hire(employee, title)
        if !valid_title?(title)
            raise "not hiring " + title
        else
            @employees << Employee.new(employee, title)
        end
    end

    def size
        @employees.count
    end

    def pay_employee(employee)
        title = employee.title
        salary = @salaries[title]
        if @funding > salary
            employee.pay(salary)
            @funding -= salary
        else
            raise "not enough funding to pay the employee"
        end
    end

    def payday
        @employees.each { |emp| pay_employee(emp) }
    end

end

# salaries = {
#     "CEO"=>4800,
#     "CTO"=>3800,
#     "Pilot"=>2500
# }

# pExpress = Startup.new("Planet Express", 30000, salaries)

# pExpress.hire("diego","Pilot")
# p pExpress.employees
# pExpress.pay_employee("diego")
