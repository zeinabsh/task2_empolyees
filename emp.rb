require 'date'

class Employees
  attr_accessor :id, :name, :join_date, :salary, :department

  def initialize()
  end

  def create()
    puts "Enter new id"
    @id = gets.chomp.to_i
    puts "Enter Name of employee"
    @name = gets.chomp
    puts "Enter date joined"
    @join_date = get_valid_date_input
    puts "Enter Salary"
    @salary = gets.chomp
    puts "Enter Department"
    @department = gets.chomp
    return self
   
  end

  def get_valid_date_input
    loop do
      input = gets.chomp
      begin
        return Date.parse(input)
      rescue Date::Error
        puts "Invalid date format. Please enter date in YYYY-MM-DD format:"
      end
    end
  end

  def update(employees_arr=[])
    puts "Enter the ID of the employee you want to update:"
    id = gets.chomp 
    
    employees_arr.each do |employee|
      if employee.id == id
        
        puts "What information would you like to update?"
        puts "Name -> N"
        puts "Salary -> S"
        puts "Join Date -> J"
        puts "Department -> D"
        choice = gets.chomp.upcase
        case choice
        when "N"
          puts "Enter new name:"
          new_name = gets.chomp
          employee.name = new_name
        when "S"
          puts "Enter new salary:"
          new_salary = gets.chomp
          employee.salary = new_salary
        when "J"
          puts "Enter new join date:"
          new_join_date = gets.chomp
          employee.join_date = new_join_date
        when "D"
          puts "Enter new department:"
          new_department = gets.chomp
          employee.department = new_department
        else
          puts "Invalid choice!"
        end                   
      else 
        puts "Employee with ID #{id} is not exists."
        break
      end 
    end
  end

  def display(employees_arr = [])
    if employees_arr.empty?
      puts "No employees found."
    else
      employees_arr.each do |employee|
        puts "Employee ID: #{employee.id}"
        puts "Name: #{employee.name}"
        puts "Join Date: #{employee.join_date}"
        puts "Salary: #{employee.salary}"
        puts "Department: #{employee.department}"
        puts "------------------"
      end
    end
  end

  def delete(employees_arr = [])
    puts "Enter the ID of the employee you want to delete:"
    id = gets.chomp 

    if employees_arr.any? { |employee| employee.id == id }
      employees_arr.delete_if { |employee| employee.id == id }
      puts "Employee with ID #{id} has been deleted."
    else 
      puts "Employee with ID #{id} does not exist."
    end
  end

  def search(employees_arr = [])
    puts "Enter what you need to search:"
    puts "1 - ID"
    puts "2 - Name"
    choice = gets.chomp.to_i

    case choice
    when 1
      puts "Enter ID:"
      id = gets.chomp
  
      if employees_arr.any? { |employee| employee.id == id }
        employees_arr.each do |employee|
          if employee.id == id
           
            puts "Employee ID: #{employee.id}"
            puts "Name: #{employee.name}"
            puts "Join Date: #{employee.join_date}"
            puts "Salary: #{employee.salary}"
            puts "Department: #{employee.department}"
            puts "------------------"
          end
        end
      else
        puts "Employee with ID #{id} does not exist."
      end
    when 2
      puts "Enter name:"
      name = gets.chomp
   
      if employees_arr.any? { |employee| employee.name == name }
        employees_arr.each do |employee|
          if employee.name == name
            found=true
            puts "Employee ID: #{employee.id}"
            puts "Name: #{employee.name}"
            puts "Join Date: #{employee.join_date}"
            puts "Salary: #{employee.salary}"
            puts "Department: #{employee.department}"
            puts "------------------"
          end
        end
      else
        puts "No employee found with the name #{name}." 
      end
    else
      puts "Invalid choice!"
    end
  end
end

employees_arr = []

loop do
  puts "Choose an option from the menu:"
  puts "1 - Add"
  puts "2 - Update"
  puts "3 - Delete"
  puts "4 - Display"
  puts "5 - Search"
  puts "6 - Exit"
  cho = gets.chomp.to_i

  case cho
  when 1
    employees_arr << Employees.new.create()
    puts "Employee with ID #{employees_arr.last.id} has been added."
  when 2
    Employees.new.update(employees_arr)
  when 3
    Employees.new.delete(employees_arr)
  when 4
    Employees.new.display(employees_arr)
  when 5
    Employees.new.search(employees_arr)
  when 6
    puts "Exiting the program. Goodbye!"
    break
  else 
    puts "Invalid choice!"
  end 
end
