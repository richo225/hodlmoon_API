class TransactionSerializer
  include FastJsonapi::ObjectSerializer

  attributes :process,
             :amount,
             :humanised_price,
             :humanised_total_price,
             :price,
             :total_price,
             :price_currency,
             :exchange,
             :created_at,
             :updated_at

  belongs_to :coin, links: {
    object: ->(transaction) {
      "/coins/#{transaction.coin_id}"
    },
    symbol: ->(transaction) {
      transaction.coin.symbol
    },
    icon_url: ->(transaction) {
      Rails.application.routes.url_helpers.url_for(transaction.coin.icon)
    }
  }

  belongs_to :exchange, links: {
    object: ->(transaction) {
      "/exchanges/#{transaction.exchange_id}"
    },
    name: ->(transaction) {
      transaction.exchange.name
    }
  }

  attribute :created_at do |transaction|
    I18n.l(transaction.created_at, format: :long)
  end

  attribute :updated_at do |transaction|
    I18n.l(transaction.updated_at, format: :long)
  end
end
