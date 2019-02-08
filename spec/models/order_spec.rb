require 'support/factory_bot'

RSpec.describe 'Order' do
  describe 'validations' do
    it 'is valid with valid_attributes' do
      order = FactoryBot.build(:order)
      expect(order).to be_valid
    end

    it 'is invalid without coin' do
      order = FactoryBot.build(:order, coin: nil)
      expect(order).to_not be_valid
    end

    it 'is invalid without amount' do
      order = FactoryBot.build(:order, amount: nil)
      expect(order).to_not be_valid
    end

    it 'is invalid with a zero amount' do
      order = FactoryBot.build(:order, amount: 0)
      expect(order).to_not be_valid
    end

    it 'is invalid without exchange' do
      order = FactoryBot.build(:order, exchange: nil)
      expect(order).to_not be_valid
    end
  end

  describe 'price' do
    it 'is invalid without price' do
      order = FactoryBot.build(:order, price: nil)
      expect(order).to_not be_valid
    end

    it 'matches price with currency attribute' do
      is_expected.to(
        monetize(:price_cents).with_model_currency(:price_currency)
      )
    end
  end

  describe 'price_currency' do
    it 'is invalid without currency' do
      order = FactoryBot.build(:order, price_currency: nil)
      expect(order).to_not be_valid
    end
  end
end
