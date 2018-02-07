require 'rails_helper'

describe Contact, type: :model do
  before(:each) { @company = Company.create(name: 'ESPN') }
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a full_name' do
        contact = @company.contacts.new(position: 'Hiring Manager', email: 'penelope@wooo.com')

        expect(contact).to be_invalid
      end

      it 'is invalid without a position' do
        contact = @company.contacts.new(full_name: 'Penelope Santorini', email: 'penelope@wooo.com')

        expect(contact).to be_invalid
      end

      it 'is invalid without an email' do
        contact = @company.contacts.new(full_name: 'Penelope Santorini', position: 'Hiring Manager')

        expect(contact).to be_invalid
      end

      it 'is invalid without a company' do
        contact = Contact.new(full_name: 'Penelope Santorini', position: 'Hiring Manager')

        expect(contact).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a full_name, position, email and company' do
        contact = @company.contacts.new(full_name: 'Penelope Santorini', position: 'Hiring Manager', email: 'penelope@wooo.com')

        expect(contact).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to a company' do
      contact = build(:contact)

      expect(contact).to respond_to(:company)
    end
  end
end
