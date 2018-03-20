require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    it 'is valid with valid_attributes' do
      transaction = build(:transaction)
      expect(transaction).to be_valid
    end

    it 'is invalid without coin' do
      transaction = build(:transaction, coin: nil)
      expect(transaction).to_not be_valid
    end

    it 'is invalid without amount' do
      transaction = build(:transaction, amount: nil)
      expect(transaction).to_not be_valid
    end

    it 'is invalid with a zero amount' do
      transaction = build(:transaction, amount: 0)
      expect(transaction).to_not be_valid
    end

    it 'is invalid without currency' do
      transaction = build(:transaction, currency: nil)
      expect(transaction).to_not be_valid
    end

    it 'is invalid without exchange' do
      transaction = build(:transaction, exchange: nil)
      expect(transaction).to_not be_valid
    end
  end
end
