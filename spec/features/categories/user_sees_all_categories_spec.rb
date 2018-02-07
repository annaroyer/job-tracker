require 'rails_helper'

describe 'As a user' do
  context 'when I visit categories index' do
    it 'I can see all categories' do
      categories = create_list(:category, 5)

      visit categories_path

      categories.each do |category|
        expect(page).to have_link(category.title)
      end
    end
  end
end
