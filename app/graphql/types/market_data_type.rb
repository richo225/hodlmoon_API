module Types
  class MarketDataType < Types::BaseObject
    field :active_cryptocurrencies, Integer, null: false
    field :active_market_pairs, Integer, null: false
    field :active_exchanges, Integer, null: false
    field :eth_dominance, Integer, null: false
    field :btc_dominance, Integer, null: false
    field :total_market_cap, GraphQL::Types::BigInt, null: false
    field :total_volume_24h, GraphQL::Types::BigInt, null: false
    field :total_volume_24h_reported, GraphQL::Types::BigInt, null: false
    field :altcoin_volume_24h, GraphQL::Types::BigInt, null: false
    field :altcoin_volume_24h_reported, GraphQL::Types::BigInt, null: false
    field :altcoin_market_cap, GraphQL::Types::BigInt, null: false
    field :last_updated, String, null: false

    def total_market_cap
      object.dig('quote', 'USD', 'total_market_cap')
    end

    def total_volume_24h
      object.dig('quote', 'USD', 'total_volume_24h')
    end

    def total_volume_24h_reported
      object.dig('quote', 'USD', 'total_volume_24h_reported')
    end

    def altcoin_volume_24h
      object.dig('quote', 'USD', 'altcoin_volume_24h')
    end

    def altcoin_volume_24h_reported
      object.dig('quote', 'USD', 'altcoin_volume_24h_reported')
    end

    def altcoin_market_cap
      object.dig('quote', 'USD', 'altcoin_market_cap')
    end
  end
end
