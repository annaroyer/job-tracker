require "rails_helper"

describe "User edits an existing job" do
  scenario "a user can see the previous job information" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    visit edit_company_job_path(company, job)

    expect(current_path).to eq(edit_job_path(job))
    expect(page).to have_field("Title", with: "Developer")
    expect(page).to have_field("Description")
    expect(page).to_not have_field("Level of Interest", with: "70")
    expect(page).to_not have_field("City", with: "Denver")
  end

  scenario "a user can edit a job" do
    Company.create!(name: "Cool Beans Coffee")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Musician"
    fill_in "job[description]", with: "Make Tens of Dollars"
    fill_in "job[level_of_interest]", with: "70"
    select("Cool Beans Coffee", from("Companies"))
    fill_in "city", with: "Portland"
    click_button "Update"

    expect(current_path).to eq("/jobs/#{Job.last.id}/jobs")
    expect(page).to have_content("EA Sports")
    expect(page).to_not have_content("ESPN")
  end
end
