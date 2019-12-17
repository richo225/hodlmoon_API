class Portfolio < ApplicationRecord
  include MoneyRails::ActionViewExtension

  belongs_to :user
  has_many :holdings, through: :user

  monetize :total_holdings_price_cents, with_model_currency: :currency
  monetize :total_profit_loss_cents, with_model_currency: :currency
  monetize :total_price_change_1h_cents, with_model_currency: :currency
  monetize :total_price_change_24h_cents, with_model_currency: :currency
  monetize :total_price_change_7d_cents, with_model_currency: :currency

  def humanised_total_holdings_price
    humanized_money_with_symbol(total_holdings_price)
  end

  def humanised_total_profit_loss
    humanized_money_with_symbol(total_profit_loss)
  end

  def humanised_total_price_change_1h
    humanized_money_with_symbol(total_price_change_1h)
  end

  def humanised_total_price_change_24h
    humanized_money_with_symbol(total_price_change_24h)
  end

  def humanised_total_price_change_7d
    humanized_money_with_symbol(total_price_change_7d)
  end
end
