class ChangePriceType < ActiveRecord::Migration[5.1]
  def change
    add_monetize :orders, :price
  end
end
