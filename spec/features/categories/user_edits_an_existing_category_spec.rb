require 'rails_helper'

describe 'As a user' do
  context 'when I click edit on a category on categories index' do
    it "I can see a form prepopulated with the category's information" do
      category = Category.create!(title: 'Education')

      visit categories_path
      click_on 'Edit'

      expect(current_path).to eq(edit_category_path(category))
      expect(page).to have_field('Title', with: category.title)
    end

    it 'I can fill in the information and edit the category' do
      category = Category.create!(title: 'Education')

      visit categories_path
      click_on 'Edit'
      fill_in 'category[title]', with: 'Web Development'
      click_on 'Edit Category'

      expect(current_path).to eq(category_path(category))
      expect(page).to have_content('You edited Web Development category')
      within 'h1' do
        expect(page).to have_content('Web Development')
      end
    end
  end
end
