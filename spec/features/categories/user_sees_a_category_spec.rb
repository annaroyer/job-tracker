require 'rails_helper'

describe 'As a user' do
  context 'when I visit a category show' do
    it "I can see it's title and all jobs with that category" do
      category = create(:category)
      jobs = create_list(:job, 5, category: category)

      visit category_path(category)

      expect(page).to have_content(category.title)
      jobs.each do |job|
        expect(page).to have_link(job.title)
      end
    end
  end
end
