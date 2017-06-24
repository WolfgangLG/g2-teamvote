class Employee < ActiveRecord::Base

  def self.find_employees
    response = HTTParty.get("https://api.myjson.com/bins/16roa3")
    json = JSON.parse(response.body)
  end
end
