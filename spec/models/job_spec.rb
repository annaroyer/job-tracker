require 'rails_helper'

describe Job do
  describe 'validations' do
    before(:each) do
      @company = create(:company)
      @category = create(:category)
    end
    context 'invalid attributes' do
      it 'is invalid without a title' do
        job = Job.new(level_of_interest: 80, description: 'Wahoo', city: 'Denver', company: @company, category: @category)
        expect(job).to be_invalid
      end

      it 'is invalid without a level of interest' do
        job = Job.new(title: 'Developer', description: 'Wahoo', city: 'Denver', company: @company, category: @category)
        expect(job).to be_invalid
      end

      it 'is invalid without a city' do
        job = Job.new(title: 'Developer', description: 'Wahoo', level_of_interest: 80, company: @company, category: @category)
        expect(job).to be_invalid
      end

      it 'is invalid without a company' do
        category = Category.create!(title: 'Education')
        job = Job.new(title: 'Developer', description: 'Wahoo', level_of_interest: 80, category: @category)
        expect(job).to be_invalid
      end

      it 'is invalid without a category' do
        company = Company.create!(name: 'Turing')
        job = Job.new(title: 'Developer', description: 'Wahoo', level_of_interest: 80, company: @company)
        expect(job).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a title, level of interest, a company, and a category' do
        job = Job.new(title: 'Developer', level_of_interest: 40, city: 'Denver', company: @company, category: @category)
        expect(job).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to a company' do
      job = build(:job)
      expect(job).to respond_to(:company)
    end
  end

  describe 'class methods' do
    describe '.sort' do
      it 'sorts all jobs by location or interest level' do
        job_1 = create(:job, city: 'San Francisco', level_of_interest: 90)
        job_2 = create(:job, city: 'Denver', level_of_interest: 40)
        job_3 = create(:job, city: 'New York', level_of_interest: 10)
        job_4 = create(:job, city: 'Atlanta', level_of_interest: 50)

        expect(Job.sort(:location)).to eq([job_4, job_2, job_3, job_1])
        expect(Job.sort(:interest)).to eq([job_3, job_2, job_4, job_1])
      end
    end
  end
end
