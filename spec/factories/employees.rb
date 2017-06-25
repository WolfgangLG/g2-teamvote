FactoryGirl.define do
  factory :employee do
    name Faker::Name.name
    image_url Faker::Avatar.image
    g2employee_id Random.rand(10)
    title Faker::Job.title
    bio Faker::Lorem.paragraph(2)
  end
end
