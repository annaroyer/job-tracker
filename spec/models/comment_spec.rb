require 'rails_helper'

describe Comment, type: :model do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without content' do
        job = create(:job)
        comment = job.comments.new

        expect(comment).to be_invalid
      end

      it 'is invalid without a job' do
        comment = Comment.new(content: 'looks great')

        expect(comment).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with content and a job' do
        job = create(:job)
        comment = job.comments.new(content: 'looks great')

        expect(comment).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to a job' do
      comment = build(:comment)

      expect(comment).to respond_to(:job)
    end
  end
end
