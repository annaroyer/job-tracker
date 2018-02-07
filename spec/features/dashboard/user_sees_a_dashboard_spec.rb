require 'rails_helper'

describe 'As a user' do
  context 'when I visit dashboard' do
    scenario 'I can see a count of jobs by level of interest' do
      create(:job, level_of_interest: 50)
      create(:job, level_of_interest: 50)
      create(:job, level_of_interest: 50)
      create(:job, level_of_interest: 90)
      create(:job, level_of_interest: 60)
      create(:job, level_of_interest: 60)

      visit '/dashboard'

      expect(page).to have_content()
    end
  end
end
