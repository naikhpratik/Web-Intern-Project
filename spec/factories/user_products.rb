FactoryGirl.define do
  factory :user_product do
    product_id 1
    user_id 1
    relationship "MyString"
  end
end
