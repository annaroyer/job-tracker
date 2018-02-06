require 'rails_helper'

describe Comment, type: :model do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without content' do
        company = Company.create!(name: 'ESPN')
        category = Category.create!(title: 'sports')
        job = Job.create!(title: 'sports analyst', description: 'fun', level_of_interest: '60',category: category, company: company, city: 'Denver')
        comment = job.comments.new

        expect(comment).to be_invalid
      end

      it 'is invalid without a job' do
        comment = Comment.new(content: 'looks great')

        expect(comment).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with content' do
        company = Company.create!(name: 'ESPN')
        category = Category.create!(title: 'sports')
        job = Job.create!(title: 'sports analyst', description: 'fun', level_of_interest: '60',category: category, company: company, city: 'Denver')
        comment = job.comments.new(content: 'looks great')

        expect(comment).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to a job' do
      company = Company.create!(name: 'ESPN')
      category = Category.create!(title: 'sports')
      job = Job.create!(title: 'sports analyst', description: 'fun', level_of_interest: '60',category: category, company: company, city: 'Denver')
      comment = job.comments.new

      expect(comment).to respond_to(:job)
    end
  end
end
