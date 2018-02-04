require 'rails_helper'

describe 'As a user' do
  context 'when I visit new category' do
    it 'I can create a new category' do
      visit new_category_path

      fill_in 'Title', with: 'Education'
      click_on 'Create Category'

      expect(current_path).to eq(category_path(1))
      expect(page).to have_content('Education')
    end
  end
end
