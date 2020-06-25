class Employee
    attr_accessor :name, :title, :salary, :boss
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def name
        @name
    end
    

    def employee_bonus(mutiplier)
      bonus =  self.salary * mutiplier
    end
end



class Manager < Employee
    attr_accessor :employees, :salary
    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @employees = []
    end

    def manager_bonus(mutiplier)
        # return  if employees.length == 0
    end

    def sum_of_employee_salaries
        salary_sum = 0
        @employees.each do |employee|
            salary_sum += employee.salary
            # salary_sum += employee.sum_of_employee_salaries
        end
        salary_sum
    end

end

# n = Manager.new('Ned', 'founder', 1000000, nil, ['Darren, Shawna', 'Davide'])
# d = Manager.new('Darren','Ta-manager',78000, ['Shawna', 'Davide'])
# a = Employee.new('Aaron', 'TA', 12000)
# v = Employee.new('Vanessa','TA', 10000)