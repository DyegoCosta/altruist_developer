FactoryGirl.define do
  sequence :email do |n|
    "contact_#{n}@altruistdeveloper.org"
  end
  
  factory :organization do
    email
    password 'my_password'
    password_confirmation 'my_password'
  end
end
