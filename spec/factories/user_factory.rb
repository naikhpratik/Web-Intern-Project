FactoryGirl.define do
  factory :user do
    name "Naik"
    password  "secret"
    password_confirmation "secret"
  end

  factory :admin do
    name "admin"
    password "admin"
    password_confirmation "admin"
    isadmin "true"
  end

  factory :notadmin do
    name "admin"
    password "admin"
    password_confirmation "admin"
    isadmin "false"
  end
end
