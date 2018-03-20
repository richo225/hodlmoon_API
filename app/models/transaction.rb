class Transaction < ApplicationRecord
  validates_numericality_of :amount, greater_than: 0
  validates_presence_of :coin, :amount, :currency, :exchange
end
