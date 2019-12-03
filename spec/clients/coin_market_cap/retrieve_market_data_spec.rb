# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoinMarketCap::RetrieveMarketData, :vcr do
  subject(:response) { described_class.call }

  describe '#call' do
    it 'returns 200' do
      expect(response.code).to eq(200)
    end

    it 'returns the market data' do
      fields = %w(btc_dominance active_cryptocurrencies active_exchanges quote)
      expect(response.parsed_response['data'].keys)
        .to include(*fields)
    end
  end
end
