# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transaction' do
  describe 'validations' do
    it 'is valid with valid_attributes' do
      transaction = build(:transaction)
      expect(transaction).to be_valid
    end

    it 'is invalid without a process' do
      transaction = build(:transaction, process: nil)
      expect(transaction).to_not be_valid
    end

    it 'is invalid with an incorrect process' do
      transaction = build(:transaction, process: 'incorrect_process')
      expect(transaction).to_not be_valid
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

    it 'is invalid without exchange' do
      transaction = build(:transaction, exchange: nil)
      expect(transaction).to_not be_valid
    end
  end

  describe 'price' do
    let(:transaction) { build(:transaction) }

    it 'matches price with currency attribute' do
      expect(transaction).to monetize(:price_cents)
        .with_model_currency(:price_currency)
    end
  end

  describe 'price_currency' do
    it 'is invalid without currency' do
      transaction = build(:transaction, price_currency: nil)
      expect(transaction).to_not be_valid
    end
  end

  describe '#total_price_cents' do
    it 'gives the correct total' do
      transaction = build(:transaction, amount: 12, price: 3.20)
      expect(transaction.total_price_cents).to eq(3840)
    end
  end
end
