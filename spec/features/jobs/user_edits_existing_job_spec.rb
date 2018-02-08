require 'rails_helper'

describe 'As a user' do
  context 'when I visit company jobs page and click edit on a job'
  before(:each) { @job = create(:job) }
    scenario 'I can see a form prepopulated with the previous job information' do
      visit company_path(@job.company)
      click_on 'Edit'

      expect(page).to have_field('Title', with: @job.title)
      expect(page).to have_field('Description', with: @job.description)
      expect(page).to have_field('Level of interest', with: @job.level_of_interest)
      expect(page).to have_field('City', with: @job.city)
      expect(page).to have_select('Category', with_selected: @job.category.title)
    end

  scenario 'I can edit that job' do
    category = create(:category)
    visit edit_job_path(@job)

    fill_in 'job[title]', with: 'Musician'
    fill_in 'job[description]', with: 'Make Tens of Dollars'
    fill_in 'job[level_of_interest]', with: '70'
    fill_in 'job[city]', with: 'Portland'
    select(category.title, from: 'job[category_id]')
    click_button 'Update Job'

    expect(page).to have_content('Musician')
    expect(page).to have_content('Make Tens of Dollars')
    expect(page).to have_content('70')
    expect(page).to have_content('Portland')
    expect(page).to have_content(category.title)
    expect(page).to have_content("You updated Musician job at #{@job.company.name}")
  end
end
