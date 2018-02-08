require 'rails_helper'

describe Company do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'uniqueness' do
    it { should validate_uniqueness_of :name }
  end

  describe 'relationships' do
    it { should have_many :jobs }
    it { should have_many :contacts }
  end
end
