require 'rails_helper'

describe Category, type: :model do
  describe 'validations' do
    it 'is invalid without a title' do
      category_1 = Category.create!(title: 'Education')
      category_2 = Category.create!

      expect(category_1).to be_valid
      expect(category_2).to be_invalid
    end
  end
end
