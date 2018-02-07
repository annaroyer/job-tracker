require 'rails_helper'

describe 'As a user' do
  context 'when I visit a job show page' do
    scenario 'I can see all comments for that job' do
      job = create(:job)
      comments = create_list(:comment, 5, job: job)

      visit job_path(job)

      comments.each do |comment|
        expect(page).to have_content(comment.content)
      end
    end
  end
end
