require 'rails_helper'

describe 'As a user' do
  context 'when I click delete on a category in the category index' do
    it 'I can delete that category' do
      category_1 = Category.create!(title: 'Education')
      category_2 = Category.create!(title: 'Web Development')

      visit categories_path
      expect(page).to have_content(category_1.title)
      expect(page).to have_content(category_2.title)

      within '.category_2' do
        click_on 'Delete'
      end

      expect(current_path).to eq(categories_path)
      expect(page).to have_content(category_1.title)
      expect(page).to have_content("You deleted #{category_2.title} category")
      within 'ul' do
        expect(page).to_not have_content(category_2.title)
      end
    end
  end
end
