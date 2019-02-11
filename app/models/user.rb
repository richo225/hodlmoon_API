class User < ApplicationRecord
  has_one :portfolio
  has_many :orders
end
