require 'rails_helper'

RSpec.describe VotesController, type: :controller do
  let(:my_employee) { FactoryGirl.create(:employee) }
  let(:my_vote) { Vote.create!(value: 1) }

  context "visitor" do
    before do
      request.env["HTTP_REFERER"] = employees_index_path
    end

    describe "POST up_vote" do
      it "increases the number of employee votes by one" do
        votes = my_employee.votes.count
        post :up_vote, employee_id: my_employee.id
        expect(my_employee.votes.count).to eq(votes + 1)
      end

      it "increases the sum of employee votes by one" do
        points = my_employee.points
        post :up_vote, employee_id: my_employee.id
        expect(my_employee.points).to eq(points + 1)
      end

      it "redirects back to the employee index page" do
        request.env["HTTP_REFERER"] = employees_index_path
        post :up_vote, employee_id: my_employee.id
        expect(response).to redirect_to(employees_index_path)
      end
    end

    describe "POST down_vote" do
      it "decreases the number of employee votes by one" do
        votes = my_employee.votes.count
        post :down_vote, employee_id: my_employee.id
        expect(my_employee.votes.count).to eq(votes + 1)
      end

      it "decreases the sum of employee votes by one" do
        points = my_employee.points
        post :down_vote, employee_id: my_employee.id
        expect(my_employee.points).to eq(points - 1)
      end

      it "redirects back to the employee index page" do
        request.env["HTTP_REFERER"] = employees_index_path
        post :down_vote, employee_id: my_employee.id
        expect(response).to redirect_to(employees_index_path)
      end
    end
  end
end
