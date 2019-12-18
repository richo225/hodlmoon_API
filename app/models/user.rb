class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_one :portfolio, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :holdings, dependent: :destroy
  has_many :coins, through: :holdings
end
