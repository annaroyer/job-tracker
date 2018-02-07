require 'rails_helper'

describe 'As a user' do
  before(:each) { @company = create(:company) }
  context'when I visit companies index and click edit on a company' do
    scenario "I can see a form prepopulated with that company's information" do
      visit companies_path
      click_on 'Edit'

      expect(page).to have_field('Name', with: @company.name)
    end

    scenario 'I can edit that company' do
      visit edit_company_path(@company)

      fill_in "company[name]", with: "EA Sports"
      click_button "Update Company"

      expect(page).to have_content("EA Sports")
      expect(page).to_not have_content(@company.name)
    end
  end
end
