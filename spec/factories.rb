FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "Company #{n}" }
  end

  factory :job do
    sequence(:title) { |n| "Title #{n}" }
    description 'so fun!'
    level_of_interest 50
    city 'Denver'
    company
    category
  end

  factory :category do
    sequence(:title) { |n| "Category #{n}" }
  end

  factory :comment do
    sequence(:content) { |n| "Content #{n}" }
    job
  end

  factory :contact do
    full_name "Penelope Santorini"
    position "Hiring Manager"
    sequence(:email) { |n| "name_#{n}@yahoo.com" }
    association :company
  end
end
