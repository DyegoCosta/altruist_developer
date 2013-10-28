FactoryGirl.define do
  factory :project do
    title 'Project title'
    description 'Project description'
    team_max_size 10
    organization
  end
end
