# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Coin' do
  describe 'validations' do
    it 'is valid with valid_attributes' do
      coin = build(:coin)
      expect(coin).to be_valid
    end

    it 'is invalid without name' do
      coin = build(:coin, name: nil)
      expect(coin).to_not be_valid
    end

    it 'is invalid without symbol' do
      coin = build(:coin, symbol: nil)
      expect(coin).to_not be_valid
    end

    it 'is invalid without attached icon' do
      coin = build(:coin, icon: nil)
      expect(coin).to_not be_valid
    end
  end
end
