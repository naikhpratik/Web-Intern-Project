FactoryGirl.define do

  factory :product do
    name { Faker::Name.name }
    icon "MyText"
  end


end
