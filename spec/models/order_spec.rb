# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Order' do
  describe 'validations' do
    it 'is valid with valid_attributes' do
      order = build(:order)
      expect(order).to be_valid
    end

    it 'is invalid without coin' do
      order = build(:order, coin: nil)
      expect(order).to_not be_valid
    end

    it 'is invalid without amount' do
      order = build(:order, amount: nil)
      expect(order).to_not be_valid
    end

    it 'is invalid with a zero amount' do
      order = build(:order, amount: 0)
      expect(order).to_not be_valid
    end

    it 'is invalid without exchange' do
      order = build(:order, exchange: nil)
      expect(order).to_not be_valid
    end
  end

  describe 'price' do
    let(:order) { build(:order) }

    it 'matches price with currency attribute' do
      expect(order).to monetize(:price_cents)
        .with_model_currency(:price_currency)
    end
  end

  describe 'price_currency' do
    it 'is invalid without currency' do
      order = build(:order, price_currency: nil)
      expect(order).to_not be_valid
    end
  end

  describe '#total_price_cents' do
    it 'gives the correct total' do
      order = build(:order, amount: 12, price: 3.20)
      expect(order.total_price_cents).to eq(3840)
    end
  end
end
