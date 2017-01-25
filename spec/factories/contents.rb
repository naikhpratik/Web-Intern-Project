FactoryGirl.define do
  factory :content do
    product
    title "MyString"
  end

  factory :modulee do
    title "Module 1"
  end

  factory :quiz do
    title "Quiz 1"
  end

  factory :html do
    title "Html 1"
  end

  factory :flashcard do
    title "Flashcard 1"
  end
end
