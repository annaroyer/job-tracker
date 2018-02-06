require 'rails_helper'

describe 'As a user' do
  context 'when I visit a company page' do
    it 'I can delete a job' do
      company = Company.create!(name: 'ESPN')
      category = Category.create!(title: 'sports analytics')
      job = company.jobs.create!(title: 'Developer', level_of_interest: 90, city: 'Denver', category: category)

      visit company_jobs_path(company)
      expect(page).to have_link(job.title)
      click_on 'Delete'

      expect(current_path).to eq(company_jobs_path(company))
      expect(page).to_not have_link(job.title)
      expect(page).to have_content('You deleted Developer job at ESPN')
    end
  end
end
