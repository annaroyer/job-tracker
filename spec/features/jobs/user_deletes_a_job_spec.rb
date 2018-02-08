require 'rails_helper'

describe 'As a user' do
  context 'when I visit a company page and click delete on a job' do
    scenario 'I can delete a job' do
      company = create(:company)
      job = create(:job, company: company)

      visit company_path(company)
      expect(page).to have_link(job.title)
      click_link 'Delete'

      expect(page).to_not have_link(job.title)
      expect(page).to have_content("You deleted #{job.title} job at #{company.name}")
    end
  end

  context 'when I visit a job page and click delete' do
    scenario 'I can delete that job' do
      job = create(:job)

      visit job_path(job)
      expect(page).to have_content(job.title)
      click_link 'Delete'

      expect(current_path).to eq(company_path(job.company))
      expect(page).to have_content("You deleted #{job.title} job at #{job.company.name}")
      expect(page).to_not have_link(job.title)
    end
  end
end
