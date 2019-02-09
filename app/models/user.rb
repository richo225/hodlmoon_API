class User < ApplicationRecord
  has_one :portfolio
  has_many :orders, through: :portfolio
end
