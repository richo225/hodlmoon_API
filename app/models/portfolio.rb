class Portfolio < ApplicationRecord
  include MoneyRails::ActionViewExtension

  belongs_to :user

  monetize :total_holdings_price_cents, with_model_currency: :currency
  monetize :total_profit_loss_cents, with_model_currency: :currency
  monetize :total_price_change_1h_cents, with_model_currency: :currency
  monetize :total_price_change_24h_cents, with_model_currency: :currency
  monetize :total_price_change_7d_cents, with_model_currency: :currency
end
