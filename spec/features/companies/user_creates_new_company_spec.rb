 require 'rails_helper'

describe 'As a user' do
  context "when I visit a new company form and fill in the information" do
    scenario 'I can create a new company' do
      visit companies_path
      click_on 'Create a New Company'

      fill_in 'company[name]', with: 'ESPN'
      click_button 'Create Company'

      expect(page).to have_content('ESPN')
    end
  end
end
