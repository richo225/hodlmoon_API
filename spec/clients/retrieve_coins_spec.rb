# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RetrieveCoins, :vcr do
  let(:response) { described_class.call }

  describe '#call' do
    it 'returns 200' do
      expect(response.code).to eq(200)
    end

    it 'returns the coin attributes' do
      fields = %w(id name symbol quote)
      expect(response.parsed_response['data'].first.keys)
        .to include(*fields)
    end

    it 'returns an array of coins' do
      expect(response.parsed_response['data']).to be_an_instance_of(Array)
    end
  end
end
