class EmployeesController < ApplicationController
  before_filter :set_employees

  def index
  end

  private

  def set_employees
    @employees = Employee.all

    if @employees.empty?
      Employee.find_employees
    end
  end
end
