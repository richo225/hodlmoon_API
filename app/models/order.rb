# frozen_string_literal: true

class Order < ApplicationRecord
  attr_accessor :price_cents, :price_currency

  belongs_to :portfolio
  belongs_to :coin

  monetize :price_cents, with_model_currency: :price_currency
end
