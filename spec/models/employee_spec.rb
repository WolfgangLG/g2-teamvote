require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) { Employee.create!(
      name:"Dr. Test",
      image_url: Faker::Company.logo,
      g2employee_id: 1,
      title: Faker::Job.title,
      bio: Faker::Lorem.paragraph(2)
  )}

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
end
