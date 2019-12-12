require 'rails_helper'

RSpec.describe Types::QueryType, type: :request do
  subject(:result) { HodlmoonApiSchema.execute(query).as_json }

  describe '#exchanges' do
    let!(:exchanges) { create_pair(:exchange) }
    let(:query) do
      %(
        query {
          exchanges {
            name
          }
        }
      )
    end

    it 'returns all exchanges with selected data' do
      expect(result.dig('data', 'exchanges')).to match_array(
        exchanges.map { |exchange| { "name" => exchange.name } }
      )
    end
  end

  describe '#exchange' do
    let!(:exchange) { create(:exchange) }
    let(:query) do
      %(
        query {
          exchange(id: #{exchange.id}) {
            name
          }
        }
      )
    end

    it 'returns the selected exchange' do
      expect(result.dig('data', 'exchange')).to eq("name" => exchange.name)
    end
  end

  describe '#coins' do
    let!(:coins) { create_pair(:coin) }
    let(:query) do
      %(
        query {
          coins {
            name
          }
        }
      )
    end

    it 'returns all coins with selected data' do
      expect(result.dig('data', 'coins')).to match_array(
        coins.map { |coin| { "name" => coin.name } }
      )
    end
  end

  describe '#coin' do
    let!(:coin) { create(:coin) }
    let(:query) do
      %(
        query {
          coin(id: #{coin.id}) {
            name
          }
        }
      )
    end

    it 'returns the selected coin' do
      expect(result.dig('data', 'coin')).to eq("name" => coin.name)
    end
  end

  describe '#latest_news', :vcr do
    let(:query) do
      %(
        query {
          latestNews {
            id
            title
            imageurl
          }
        }
      )
    end

    it 'returns articles with the selected data' do
      expect(result.dig('data', 'latestNews').first).to match(
        hash_including('id', 'title', 'imageurl')
      )
    end
  end

  describe '#market_data', :vcr do
    let(:query) do
      %(
        query {
          marketData {
            activeCryptocurrencies
            totalMarketCap
            ethDominance
          }
        }
      )
    end

    it 'returns selected market data' do
      expect(result.dig('data', 'marketData')).to match(
        hash_including('activeCryptocurrencies', 'totalMarketCap', 'ethDominance')
      )
    end
  end

  describe '#transactions' do
    let!(:user) { create(:user) }
    let!(:transactions) { create_pair(:transaction, user: user) }
    let(:query) do
      %(
        query {
          transactions {
            id
            process
            price
          }
        }
      )
    end

    before { create_pair(:transaction) }

    context 'when user is authenticated' do
      let!(:current_user) { user }

      xit 'returns only the users transactions' do
        expect(result.dig('data', 'transactions').count).to eq(user.transactions.count)
      end

      xit 'returns all user transactions with selected data' do
        expect(result.dig('data', 'transactions').first).to match(
          hash_including('id', 'process', 'price')
        )
      end
    end

    context 'when user is unauthenticated' do
      xit 'returns errors and no transaction data' do
        expect(result['data']).to be_nil
        expect(result['errors'].first['message']).to eq('Authentication required')
      end
    end
  end
end
