require 'rails_helper'

describe 'As a user' do
  context 'when I visit companies index' do
    scenario 'I can see all the companies' do
      companies = create_list(:company, 5)

      visit companies_path

      companies.each do |company|
        expect(page).to have_content(company.name)
      end
    end
  end
end
