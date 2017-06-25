require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  let(:g2_employees) { File.read(Rails.root.join("spec", "stubbed_requests", "g2_employees.json")) }

  describe "GET #index" do
    it "should be successful and call Employee#find_employees" do
      expect(Employee).to receive(:find_employees).and_return(g2_employees)
      get :index
      expect(response).to have_http_status(200)
    end

    it "calls .find_employees method to get a list of g2 employees" do
      employee = double
      allow(employee).to receive(:find_employees).and_return(g2_employees)
      response = employee.find_employees
      expect(response).to eq g2_employees
    end
  end

end
