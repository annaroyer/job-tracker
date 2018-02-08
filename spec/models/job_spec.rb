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
    before(:each) do
      @job_1 = create(:job, city: 'San Francisco', level_of_interest: 90)
      @job_2 = create(:job, city: 'Denver', level_of_interest: 40)
      @job_3 = create(:job, city: 'New York', level_of_interest: 10)
      @job_4 = create(:job, city: 'Atlanta', level_of_interest: 50)
    end
    describe '.sort' do
      it 'sorts all jobs by location or interest level' do
        expect(Job.sort('location')).to eq([@job_4, @job_2, @job_3, @job_1])
        expect(Job.sort('interest')).to eq([@job_3, @job_2, @job_4, @job_1])
      end
    end

    describe '.by_interest_level' do
      it 'counts the number of jobs at each interest level' do
        create_list(:job, 2, level_of_interest: 10)
        create_list(:job, 3, level_of_interest: 50)
        create(:job, level_of_interest: 90)

        expect(Job.by_interest_level).to eq({10 => 3, 40 => 1, 50 => 4, 90=>2})
      end
    end

    describe '.by_location' do
      it 'counts the number of jobs in each city' do
        create_list(:job, 2, city: 'San Francisco')
        create_list(:job, 3, city: 'Atlanta')
        create(:job, city: 'New York')

        expect(Job.by_location).to eq({'San Francisco' => 3, 'Atlanta' => 4, 'New York' => 2, 'Denver' => 1})
      end
    end
  end
end
