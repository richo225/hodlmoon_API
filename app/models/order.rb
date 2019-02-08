# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :portfolio
  belongs_to :coin

  monetize :price_cents, with_model_currency: :currency
  monetize :total_price_cents

  def total_price_cents
    price_cents * amount
  end
end
