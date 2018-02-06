require 'rails_helper'

describe 'As a user' do
  context 'when I visit a job show page and write a comment' do
    it 'I can create a new comment on that job' do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: 'sports analytics')
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

      visit job_path(job)
      fill_in 'comment[content]', with: 'Interview on Friday'
      click_on 'Create'

      expect(page).to have_content('Interview on Friday')
    end
  end
end
