require 'rails_helper'

describe 'As a user' do
  before(:each) { @company = create(:company) }
  context 'when I visit company index and click delete on a company' do
    scenario 'I can delete that company' do
      visit companies_path
      expect(page).to have_content(@company.name)

      within('.company_1') { click_link 'Delete' }

      expect(page).to have_content("#{@company.name} was successfully deleted!")
      within('main') { expect(page).to_not have_content(@company.name) }
    end
  end
end
