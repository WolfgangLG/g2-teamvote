class EmployeesController < ApplicationController
  def index
    @employees = Employee.find_employees
  end
end
