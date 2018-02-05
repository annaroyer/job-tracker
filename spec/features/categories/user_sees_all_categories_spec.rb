require 'rails_helper'

describe 'As a user' do
  context 'when I visit categories index' do
    it 'I can see all categories' do
      Category.create!(title: 'Web Development')
      Category.create!(title: 'Education')
      Category.create!(title: 'Finance')

      visit categories_path

      expect(page).to have_content('Web Development')
      expect(page).to have_content('Education')
      expect(page).to have_content('Finance')
    end
  end
end
