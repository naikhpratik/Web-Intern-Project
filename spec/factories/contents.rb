FactoryGirl.define do
  factory :content do
    product_id 1
    follows 1
    parent 1
    kind "MyString"
    payload "MyText"
  end
end
