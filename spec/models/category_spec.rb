require 'rails_helper'

describe Category, type: :model do
  describe 'validations' do
    it 'is invalid without a title' do
      category = Category.new

      expect(category).to be_invalid
    end

    it 'is valid with a title' do
      category = Category.create!(title: 'Education')

      expect(category).to be_valid
    end
  end

  describe 'uniqueness' do
    it 'has a unique name' do
      Category.create!(title: 'Education')
      category = Category.new(title: 'Education')

      expect(category).to be_invalid
    end
  end

  describe 'relationships' do
    it 'has many jobs' do
      category = Category.create(title: 'Education')

      expect(category).to respond_to(:jobs)
    end
  end
end
