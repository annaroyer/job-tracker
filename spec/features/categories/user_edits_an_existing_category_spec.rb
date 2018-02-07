require 'rails_helper'

describe 'As a user' do
  before(:each) { @category = create(:category) }
  context 'when I click edit on a category on categories index' do
    it "I see a form prepopulated with the category's information" do
      visit categories_path
      click_on 'Edit'

      expect(page).to have_field('Title', with: @category.title)
    end

    context 'when I click edit from a category show page' do
      it "I see a form prepopulated with the category's information" do
        visit category_path(@category)
        click_on 'Edit'

        expect(page).to have_field('Title', with: @category.title)
      end
    end

    it 'I can fill in the information and edit the category' do
      visit categories_path
      expect(page).to_not have_content('Web Development')

      click_on 'Edit'
      fill_in 'category[title]', with: 'Web Development'
      click_on 'Update Category'

      expect(current_path).to eq(category_path(@category))
      expect(page).to have_content('You edited Web Development category')
      within 'h1' do
        expect(page).to have_content('Web Development')
      end
    end
  end


end
