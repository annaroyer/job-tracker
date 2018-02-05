require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = Company.create!(name: "ESPN")
    category_1 = Category.create!(title: 'sports analytics')
    category_2 = Category.create!(title: 'Quality Assurance')
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category_1)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category_2)

    visit company_path(company)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("QA Analyst")
  end
end
