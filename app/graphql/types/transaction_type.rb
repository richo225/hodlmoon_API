module Types
  class TransactionType < Types::BaseObject
    field :id, ID, null: false
    field :process, String, null: false
    field :amount, Float, null: false
    field :humanised_price, String, null: false
    field :humanised_total_price, String, null: false
    field :price, Float, null: false
    field :total_price, Float, null: false
    field :price_currency, String, null: false
    field :exchange, Types::ExchangeType, null: false
    field :coin, Types::CoinType, null: false
    field :created_at, String, null: false
    field :updated_at, String, null: false

    def created_at
      I18n.l(object.created_at, format: :long)
    end

    def updated_at
      I18n.l(object.updated_at, format: :long)
    end
  end
end
