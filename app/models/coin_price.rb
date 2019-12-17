class CoinPrice < ApplicationRecord
  belongs_to :coin

  monetize :price_cents, with_model_currency: :currency
end
