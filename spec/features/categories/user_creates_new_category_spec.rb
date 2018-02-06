require 'rails_helper'

describe 'As a user' do
  context 'when I visit new category and fill in the information' do
    it 'I can create a new category' do
      visit new_category_path

      fill_in 'category[title]', with: 'Education'
      click_on 'Create Category'

      expect(current_path).to eq(category_path(1))
      expect(page).to have_content('Education')
      expect(page).to have_content('You created Education category')
    end

    context 'when I create a category that already exists' do
      it 'I am brought back to the new category form page' do
        Category.create!(title: 'Education')

        visit new_category_path

        fill_in 'category[title]', with: 'Education'
        click_on 'Create Category'

        expect(page).to have_content('Create a New Category')
        expect(page).to have_field('Title', with: 'Education')
      end
    end
  end
end
