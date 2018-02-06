require 'rails_helper'

describe 'As a user' do
  context 'when I visit a category show' do
    it "I can see it's title and all jobs with that category" do
      company = Company.create!(name: 'New Hights Elementary')
      category = Category.create!(title: 'Education')
      category.jobs.create!(title: 'Teacher', description: 'fulfilling', level_of_interest: '60', city: 'Denver', company: company)
      category.jobs.create!(title: 'Administrator', description: 'fulfilling',  level_of_interest: '60', city: 'Denver', company: company)
      category.jobs.create!(title: 'Paraprofessional', description: 'fulfilling',  level_of_interest: '60', city: 'Denver', company: company)

      visit category_path(category)

      expect(page).to have_content('Education')
      expect(page).to have_link('Teacher')
      expect(page).to have_link('Administrator')
      expect(page).to have_link('Paraprofessional')
    end
  end
end
