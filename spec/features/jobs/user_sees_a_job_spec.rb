require 'rails_helper'

describe 'As a user' do
  context 'when I visit a company show and click on a job' do
    scenario 'I can see a that job' do
      job = create(:job)

      visit company_jobs_path(job.company, job)
      click_on job.title

      expect(page).to have_content(job.company.name)
      expect(page).to have_content(job.title)
      expect(page).to have_content(job.description)
      expect(page).to have_content(job.level_of_interest)
      expect(page).to have_content(job.city)
      expect(page).to have_content(job.category.title)
    end
  end
end
