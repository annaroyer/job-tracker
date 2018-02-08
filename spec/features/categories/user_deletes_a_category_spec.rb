require 'rails_helper'

describe 'As a user' do
  before(:each) do
    @category_1 = create(:category)
    @category_2 = create(:category)
  end
  context 'when I click delete on a category on the category index' do
    it 'I can delete that category' do
      visit categories_path
      expect(page).to have_content(@category_1.title)
      expect(page).to have_content(@category_2.title)

      within('.category_2') { click_on 'Delete' }

      within('div') { expect(page).to_not have_content(@category_2.title) }
      expect(page).to have_content("You deleted #{@category_2.title} category")
      expect(page).to have_content(@category_1.title)
    end
  end

  context 'when I click delete on a category show page' do
    it 'I can delete that category and return to category index' do
      visit category_path(@category_1)
      click_on "Delete"

      within('div') { expect(page).to_not have_content(@category_1.title) }
      expect(page).to have_content("You deleted #{@category_1.title} category")
      expect(page).to have_content(@category_2.title)
    end
  end
end
