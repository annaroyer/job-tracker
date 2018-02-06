require 'rails_helper'

describe 'As a user' do
  context 'when I visit a company page and fill in the info for a contact' do
    it 'I can create a new contact for that company' do
      company = Company.create!(name: 'ESPN')

      visit company_path(company)
      fill_in 'contact[full_name]', with: 'Betty Sang'
      fill_in 'contact[position]', with: 'Producer'
      fill_in 'contact[email]', with: 'bspro@espn.org'
      click_on 'Create Contact'

      expect(page).to have_content('Betty Sang')
      expect(page).to have_content('Producer')
      expect(page).to have_content('bspro@espn.org')
    end
  end
end
