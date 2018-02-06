require "rails_helper"

describe "User edits an existing job" do
  scenario "a user can see the previous job information" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: 'sports analytics')
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
    visit edit_job_path(job)

    expect(page).to have_field("Title", with: "Developer")
    expect(page).to have_field("Description")
    expect(page).to have_field("Level of interest", with: "70")
    expect(page).to have_field("City", with: "Denver")
  end

  scenario "a user can edit a job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: 'sports analytics')
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
    visit edit_job_path(company, job)

    fill_in "job[title]", with: "Musician"
    fill_in "job[description]", with: "Make Tens of Dollars"
    fill_in "job[level_of_interest]", with: "70"
    fill_in "job[city]", with: "Portland"
    click_button "Update"

    expect(current_path).to eq(job_path(company, job))
    expect(page).to have_content("Musician")
    expect(page).to have_content("Make Tens of Dollars")
    expect(page).to have_content("70")
    expect(page).to have_content("Portland")
    expect(page).to have_content("You updated Musician job at ESPN")
  end
end
