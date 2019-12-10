module Types
  class QueryType < Types::BaseObject
    field :exchanges,
          [Types::ExchangeType],
          null: false,
          description: 'Returns a list of all active exchanges'

    field :coins,
          [Types::CoinType],
          null: false,
          description: 'Returns a list of all active coins ordered by cmc_rank'

    def exchanges
      Exchange.all
    end

    def coins
      Coin.order(:cmc_rank)
    end
  end
end
