# frozen_string_literal: true

class Transaction < ApplicationRecord
  include MoneyRails::ActionViewExtension

  PROCESSES = %w(buy sell).freeze

  belongs_to :user
  belongs_to :coin
  belongs_to :exchange

  validates_numericality_of :amount, greater_than: 0
  validates_presence_of :coin, :amount, :price_currency, :exchange
  validates_inclusion_of :process, in: PROCESSES

  after_create :update_holding

  monetize :price_cents, with_model_currency: :currency
  monetize :total_price_cents, with_model_currency: :currency

  scope :buy, -> { where(process: :buy) }
  scope :sell, -> { where(process: :sell) }
  scope :for_coin, ->(coin) {
    return if coin.blank?

    where(coin: coin)
  }

  PROCESSES.each do |process_name|
    define_method("#{process_name}?") do
      process == process_name.to_s
    end
  end

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

  def update_holding
    Transactions::UpdateHolding.call(transaction: self)
  end
end
