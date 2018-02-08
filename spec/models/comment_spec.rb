require 'rails_helper'

describe Comment, type: :model do
  describe 'validations' do
    it { should validate_presence_of :content }
    it { should validate_presence_of :job }
  end

  describe 'relationships' do
    it { should belong_to :job }
  end
end
