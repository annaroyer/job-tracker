require 'rails_helper'

describe 'As a user' do
  context 'when I visit a job show page and write a comment' do
    it 'I can create a new comment on that job' do
      job = create(:job)

      visit job_path(job)
      fill_in 'comment[content]', with: 'Interview on Friday'
      click_on 'Create'

      expect(page).to have_content('Interview on Friday')
    end
  end
end
