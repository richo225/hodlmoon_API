# frozen_string_literal: true

class Transaction < ApplicationRecord
  include MoneyRails::ActionViewExtension

  PROCESSES = %w(buy sell).freeze

  belongs_to :user
  belongs_to :coin

  validates_numericality_of :amount, greater_than: 0
  validates_presence_of :coin, :amount, :price_currency, :exchange
  validates_inclusion_of :process, in: PROCESSES

  monetize :price_cents, with_model_currency: :currency
  monetize :total_price_cents, with_model_currency: :currency

  def humanised_price
    humanized_money_with_symbol(price)
  end

  def total_price_cents
    return unless amount

    price_cents * amount
  end

  def humanised_total_price
    humanized_money_with_symbol(total_price)
  end
end
