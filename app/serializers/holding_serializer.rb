class HoldingSerializer
  include FastJsonapi::ObjectSerializer

  attributes :coin_id,
             :total_amount,
             :humanised_total_price,
             :humanised_total_profit_loss,
             :humanised_price_change_1h,
             :humanised_price_change_24h,
             :humanised_price_change_7d,
             :total_profit_loss_percentage,
             :created_at,
             :updated_at

  belongs_to :coin, links: {
    object: ->(holding) {
      "/coins/#{holding.coin_id}"
    },
    symbol: ->(holding) {
      holding.coin.symbol
    },
    coinio_id: ->(holding) {
      holding.coin.coinio_id
    },
    icon_url: ->(holding) {
      Rails.application.routes.url_helpers.url_for(holding.coin.icon)
    }
  }

  attribute :created_at do |holding|
    I18n.l(holding.created_at, format: :long)
  end

  attribute :updated_at do |holding|
    I18n.l(holding.updated_at, format: :long)
  end
end
