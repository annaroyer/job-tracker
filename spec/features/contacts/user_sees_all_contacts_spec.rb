require 'rails_helper'

describe 'As a user' do
  context 'when I visit a company show page' do
    scenario 'I can see all contacts for that company' do
      company = create(:company)
      contacts = create_list(:contact, 5, company: company)

      visit company_path(company)

      contacts.each do |contact|
        expect(page).to have_content(contact.full_name)
        expect(page).to have_content(contact.position)
        expect(page).to have_content(contact.email)
      end
    end
  end
end
