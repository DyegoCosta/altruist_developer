FactoryGirl.define do
  factory :team_member do
    project
    developer

    factory :team_leader do
      is_leader true
    end
  end
end
