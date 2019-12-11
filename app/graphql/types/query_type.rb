module Types
  class QueryType < Types::BaseObject
    field :exchanges,
          [Types::ExchangeType],
          null: false,
          description: 'Returns a list of all active exchanges'

    def exchanges
      Exchange.all
    end

    field :exchange,
          Types::ExchangeType,
          null: false,
          description: 'Returns a specific exchange' do
      argument :id, ID, required: true
    end

    def exchange(id:)
      Exchange.find(id)
    end

    field :coins,
          [Types::CoinType],
          null: false,
          description: 'Returns a list of all active coins ordered by cmc_rank'

    def coins
      Coin.order(:cmc_rank)
    end

    field :coin,
          Types::CoinType,
          null: false,
          description: 'Returns a specific coin' do
      argument :id, ID, required: true
    end

    def coin(id:)
      Coin.find(id)
    end

    field :transactions,
          [Types::TransactionType],
          null: false,
          description: 'Returns a list of transactions belonging to the authenticated user'

    def transactions
      user = context[:current_user]

      raise GraphQL::ExecutionError, 'Authentication required' if user.blank?

      user.transactions
    end

    field :transaction,
          Types::TransactionType,
          null: false,
          description: 'Returns a specific transaction' do
      argument :id, ID, required: true
    end

    def transaction(id:)
      user = context[:current_user]

      raise GraphQL::ExecutionError, 'Authentication required' if user.blank?

      user.transactions.find(id)
    end

    field :latest_news,
          [Types::NewsType],
          null: false,
          description: 'Returns a list of the latest cyrypto news articles'

    def latest_news
      CryptoCompare::LatestNews.call.parsed_response["Data"]
    end

    field :market_data,
          Types::MarketDataType,
          null: false,
          description: 'Returns the latest global metrics for the crypto market'

    def market_data
      CoinMarketCap::RetrieveMarketData.call.parsed_response['data']
    end
  end
end
