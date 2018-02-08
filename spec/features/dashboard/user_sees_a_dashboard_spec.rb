require 'rails_helper'

describe 'As a user' do
  context 'when I visit dashboard' do
    scenario 'I can see a count of jobs by level of interest' do

      visit '/dashboard'

      expect(page).to have_content('Jobs by Interest Level')
      expect(page).to have_content('Jobs by Location')
      expect(page).to have_content('Top 3 Companies')
      expect(page).to have_content('Top 3 Companies')
    end
  end
end
