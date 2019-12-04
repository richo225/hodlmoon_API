# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CryptoCompare::LatestNews, :vcr do
  subject(:response) { described_class.call }

  describe '#call' do
    it 'returns 200' do
      expect(response.code).to eq(200)
    end

    it 'returns the latest news articles' do
      fields = %w(guid title imageurl body categories)
      expect(response.parsed_response['Data'].first.keys)
        .to include(*fields)
    end
  end
end
