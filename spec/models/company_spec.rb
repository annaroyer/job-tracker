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

  describe 'class methods' do
    context '.top_average_interest_level' do
      it 'returns the 3 companies with the highest average interest level in order' do
        company_1 = create(:company)
        company_2 = create(:company)
        company_3 = create(:company)
        company_4 = create(:company)
        create_list(:job, 3, company: company_1, level_of_interest: 50)
        create_list(:job, 3, company: company_2, level_of_interest: 60)
        create_list(:job, 3, company: company_3, level_of_interest: 80)
        create_list(:job, 2, company: company_1, level_of_interest: 100)
        create(:job, company: company_4, level_of_interest: 90)

        expect(Company.top_average_interest_level).to eq([company_4, company_3, company_1])
      end
    end
  end

  describe 'instance methods' do
    context '#average_interest' do
      it "returns a company's job's average interest level" do
        company = create(:company)
        create(:job, company: company, level_of_interest: 50)
        create(:job, company: company, level_of_interest: 40)
        create(:job, company: company, level_of_interest: 40)
        create(:job, company: company, level_of_interest: 70)

        expect(company.average_interest).to eq(50)
      end
    end
  end
end
