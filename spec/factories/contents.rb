FactoryGirl.define do
  factory :content do
    product
    name "MyString"
  end

  factory :modulee do
    name "Module 1"
  end

  factory :sub_module do
    name "Sub Module 1"
  end

  factory :quiz do
    name "Quiz 1"
  end

  factory :video do
    name "Video 1"
    url "http://www.google.com"
  end

  factory :audio do
    name "Audio 1"
  end

  factory :html do
    name "Html 1"
  end

  factory :flashcard do
    name "Flashcard 1"
  end
end
