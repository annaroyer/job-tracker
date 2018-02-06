require 'rails_helper'

describe Contact, type: :model do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without full_name' do
        company = Company.create!(name: 'ESPN')
        contact = company.contacts.new(position: 'Hiring Manager', email: 'penelope@wooo.com')

        expect(contact).to be_invalid
      end

      it 'is invalid without a job' do
        contact = Comment.new(content: 'looks great')

        expect(contact).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with content' do
        company = Company.create!(name: 'ESPN')
        category = Category.create!(title: 'sports')
        job = Job.create!(title: 'sports analyst', description: 'fun', level_of_interest: '60',category: category, company: company, city: 'Denver')
        contact = job.contacts.new(content: 'looks great')

        expect(contact).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to a job' do
      company = Company.create!(name: 'ESPN')
      category = Category.create!(title: 'sports')
      job = Job.create!(title: 'sports analyst', description: 'fun', level_of_interest: '60',category: category, company: company, city: 'Denver')
      contact = job.contacts.new

      expect(contact).to respond_to(:job)
    end
  end
end
