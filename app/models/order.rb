# frozen_string_literal: true

class Order < ApplicationRecord
  attr_accessor :price_cents, :price_currency, :amount

  belongs_to :portfolio
  belongs_to :coin

  monetize :price_cents, with_model_currency: :price_currency
  monetize :total_price_cents

  def total_price_cents
    price_cents * amount
  end
end
