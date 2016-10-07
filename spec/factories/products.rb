FactoryGirl.define do

  factory :product do
    title { Faker::Name.name }
    visibility "All"
  end

end
