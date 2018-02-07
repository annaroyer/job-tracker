require 'rails_helper'

describe 'As a user' do
  context 'when I visit companies index and click on a company' do
    scenario 'I can see that company' do
      company = create(:company)

      visit company_path(company)

      expect(page).to have_content(company.name)
    end
  end
end
