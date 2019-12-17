class CreateCoinPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :coin_prices do |t|
      t.timestamps
      t.references :coin
      t.float :price
      t.bigint :market_cap
      t.bigint :volume_24h
      t.float :percent_change_1h
      t.float :percent_change_24h
      t.float :percent_change_7d
    end
  end
end
