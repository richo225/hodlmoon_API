class AddCoinMarketCapIdToCoins < ActiveRecord::Migration[5.2]
  def change
    add_column :coins, :coinmarketcap_id, :integer
  end
end
