FactoryGirl.define do

  factory :product do
    name { Faker::Name.name }
    visibility "All"
  end

end
