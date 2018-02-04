require 'rails_helper'

describe "User deletes existing company" do
  scenario "a user can delete a company" do
    company = Company.create(name: "ESPN")
    visit companies_path

    save_and_open_page

    within(".company_#{company.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("ESPN was successfully deleted!")
  end
end
