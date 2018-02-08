require 'rails_helper'

describe "As a user" do
  context 'when I visit jobs index' do
    scenario "I can see all jobs" do
      jobs = create_list(:job, 3)

      visit jobs_path

      jobs.each do |job|
        expect(page).to have_link(job.title)
      end
    end
  end
end
