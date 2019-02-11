# frozen_string_literal: true

class Coin < ApplicationRecord
  validates_presence_of :name, :symbol
end
