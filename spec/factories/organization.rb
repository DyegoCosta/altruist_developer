FactoryGirl.define do
  sequence :email do |n|
    "contact_#{n}@altruistdeveloper.org"
  end
  
  factory :organization do
    email
    name 'Organization X'
    password 'my_password'
    password_confirmation 'my_password'
  end
end
