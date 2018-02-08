require 'rails_helper'

describe Job do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :level_of_interest }
    it { should validate_presence_of :city }
    it { should validate_presence_of :company }
  end

  describe 'relationships' do
    it { should belong_to :company }
    it { should belong_to :category }
    it { should have_many :comments }
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
