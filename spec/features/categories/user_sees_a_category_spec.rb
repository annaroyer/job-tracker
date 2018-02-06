require 'rails_helper'

describe 'As a user' do
  context 'when I visit a category show' do
    it 'I can see information about that category' do
      category = Category.create!(title: 'Education')

      visit category_path(category)

      expect(page).to have_content('Education')
    end
  end
end
