# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :coin

  validates_numericality_of :amount, greater_than: 0
  validates_presence_of :coin, :amount, :price_currency, :exchange

  monetize :price_cents, with_model_currency: :currency
  monetize :total_price_cents, with_model_currency: :currency

  def total_price_cents
    return unless amount

    price_cents * amount
  end
end
