class PortfolioSerializer
  include FastJsonapi::ObjectSerializer

  attributes :humanised_total_holdings_price,
             :humanised_total_profit_loss,
             :humanised_total_price_change_1h,
             :humanised_total_price_change_24h,
             :humanised_total_price_change_7d,
             :total_profit_loss_percentage,
             :total_price_change_1h_percentage,
             :total_price_change_24h_percentage,
             :total_price_change_7d_percentage,
             :created_at,
             :updated_at

  has_many :holdings, links: { object: ->(_portfolio) { "/holdings" } }

  attribute :created_at do |portfolio|
    I18n.l(portfolio.created_at, format: :long)
  end

  attribute :updated_at do |portfolio|
    I18n.l(portfolio.updated_at, format: :long)
  end
end
