require 'rails_helper'

describe Contact, type: :model do
  before(:each) { @company = Company.create(name: 'ESPN') }
  describe 'validations' do
    it { should validate_presence_of :full_name }
    it { should validate_presence_of :position }
    it { should validate_presence_of :email }
    it { should validate_presence_of :company }
  end

  describe 'uniqueness' do
    it { should validate_uniqueness_of :email }
  end

  describe 'relationships' do
    it { should belong_to :company }
  end
end
