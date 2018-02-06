require 'rails_helper'

describe 'As a user' do
  context 'when I visit a company page and fill in the info for a contact' do
    it 'I can create a new contact for that company' do
      company = Company.create!(name: 'ESPN')

      visit company_path(company)
      fill_in 'contact[full_name]', with: 'Penelope Santorini'
      fill_in 'contact[position]', with: 'Hiring Manager'
      fill_in 'contact[email]', with: 'penelope@wooo.com'
      click_on 'Create Contact'

      expect(page).to have_content('Penelope Santorini')
      expect(page).to have_content('Hiring Manager')
      expect(page).to have_content('penelope@wooo.com')
    end
  end
end
