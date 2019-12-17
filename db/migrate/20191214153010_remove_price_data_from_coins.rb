class RemovePriceDataFromCoins < ActiveRecord::Migration[5.2]
  def change
    remove_column :coins, :circulating_supply
    remove_column :coins, :total_supply
    remove_column :coins, :max_supply
  end
end
