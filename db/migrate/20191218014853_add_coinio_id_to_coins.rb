class AddCoinioIdToCoins < ActiveRecord::Migration[5.2]
  def change
    add_column :coins, :coinio_id, :integer
  end
end
