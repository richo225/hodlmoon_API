# frozen_string_literal: true

class Coin < ApplicationRecord
  has_one :holding
  has_one_attached :icon

  validates_presence_of :name, :symbol, :cmc_rank
  validates :icon, attached: true
end
