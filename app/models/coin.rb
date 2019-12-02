# frozen_string_literal: true

class Coin < ApplicationRecord
  has_one_attached :icon
  validates_presence_of :name, :symbol
end
