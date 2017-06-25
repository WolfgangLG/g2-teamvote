class Employee < ActiveRecord::Base

  def self.find_employees
    response = HTTParty.get("https://api.myjson.com/bins/16roa3")
    team_members = JSON.parse(response.body)

    team_members.map do |atr|
      team_member = Employee.find_or_create_by(g2employee_id:atr['id']) do |employee|
        employee.name = atr['name']
        employee.image_url = atr['image_url']
        employee.title = atr['title']
        employee.bio = atr['bio']
      end
      team_member
    end
  end
end
