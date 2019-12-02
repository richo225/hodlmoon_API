class ChangeCoinSuppliesTo8Bytes < ActiveRecord::Migration[5.1]
  def change
    change_column :coins, :circulating_supply, :bigint
    change_column :coins, :total_supply, :bigint
    change_column :coins, :max_supply, :bigint
  end
end
