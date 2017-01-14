FactoryGirl.define do

  factory :product do
    title { Faker::Name.title }
    visibility "All"
  end

end
