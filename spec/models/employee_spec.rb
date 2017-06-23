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
end
