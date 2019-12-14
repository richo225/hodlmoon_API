class Holding < ApplicationRecord
  belongs_to :user
  belongs_to :coin

  monetize :total_price_cents, with_model_currency: :currency
  monetize :total_profit_loss_cents, with_model_currency: :currency
  monetize :price_change_1h_cents, with_model_currency: :currency
  monetize :price_change_24h_cents, with_model_currency: :currency
  monetize :price_change_7d_cents, with_model_currency: :currency
end
