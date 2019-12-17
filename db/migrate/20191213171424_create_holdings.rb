class CreateHoldings < ActiveRecord::Migration[5.2]
  def change
    create_table :holdings do |t|
      t.timestamps
      t.references :user
      t.references :coin
      t.integer :total_amount
      t.integer :total_price
      t.integer :total_profit_loss
      t.integer :price_change_1h
      t.integer :price_change_24h
      t.integer :price_change_7d
    end
  end
end
