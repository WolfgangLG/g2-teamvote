require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) { FactoryGirl.create(:employee) }

  it { is_expected.to have_many(:votes) }

  describe "attributes" do
    it "should have a name attribute" do
      expect(employee).to have_attributes(name: employee.name)
    end
  end

  describe "find_employees" do
    it "receives response from g2 employee endpoint" do
      stub_request(:get, 'https://api.myjson.com/bins/16roa3')
        .to_return(
            body: File.read(Rails.root.join("spec", "stubbed_requests", "g2_employees.json")),
            headers: {"Content-Type" => "application/json"}
        )
      answer = Employee.find_employees
      expect(answer[0]["name"]).to eq("Michael Wheeler")
    end
  end

  describe "voting" do
    before do
      3.times { employee.votes.create!(value: 1) }
      2.times { employee.votes.create!(value: -1) }
      @up_votes = employee.votes.where(value: 1).count
      @down_votes = employee.votes.where(value: -1).count
    end

    describe "up_votes" do
      it "counts the number of votes with value = 1" do
        expect( employee.up_votes ).to eq(@up_votes)
      end
    end

    describe "down_votes" do
      it "counts the number of votes with value = -1" do
        expect( employee.down_votes ).to eq(@down_votes)
      end
    end

    describe "points" do
      it "returns the sum of all down and up votes" do
        expect( employee.points ).to eq(@up_votes - @down_votes)
      end
    end
  end
end
