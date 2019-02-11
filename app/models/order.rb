# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :portfolio
  belongs_to :coin
end
