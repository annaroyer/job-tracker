FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "Company #{n}" }
  end

  factory :job do
    sequence(:title) { |n| "Title #{n}" }
    description 'so fun!'
    level_of_interest 50
    company
    category
  end

  factory :category do
    sequence(:title) { |n| "Category #{n}" }
  end

  factory :comment do
    sequence(:content) { "Content #{n}" }
    job
  end

  factory :contact do
    full_name "Penelope Santorini"
    position "Hiring Manager"
    email "paige@wooo.com"
    association :company
  end
end
