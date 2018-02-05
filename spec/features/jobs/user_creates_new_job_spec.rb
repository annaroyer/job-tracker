require 'rails_helper'

describe 'As a user' do
  context 'when I visit new company job and fill in the information' do
    scenario 'I can create a new job' do
      company = Company.create!(name: 'ESPN')
      category = Category.create!(title: 'Education')

      visit new_company_job_path(company)

      fill_in 'job[title]', with: 'Developer'
      fill_in 'job[description]', with: 'So fun!'
      fill_in 'job[level_of_interest]', with: 80
      fill_in 'job[city]', with: 'Denver'
      select(category.title, from: 'job[category]')
      click_button 'Create'


      expect(current_path).to eq(company_job_path(company, 1))
      expect(page).to have_content('ESPN')
      expect(page).to have_content('Developer')
      expect(page).to have_content('80')
      expect(page).to have_content('Denver')
      expect(page).to have_content(category.title)
      expect(page).to have_content('You created Developer job at ESPN')
    end
  end
end
