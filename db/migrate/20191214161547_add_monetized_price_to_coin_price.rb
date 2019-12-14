class AddMonetizedPriceToCoinPrice < ActiveRecord::Migration[5.2]
  def change
    remove_column :coin_prices, :price
    add_monetize :coin_prices, :price, currency: { present: false }

    remove_column :holdings, :total_price
    remove_column :holdings, :total_profit_loss
    remove_column :holdings, :price_change_1h
    remove_column :holdings, :price_change_24h
    remove_column :holdings, :price_change_7d

    add_monetize :holdings, :total_price, currency: { present: false }
    add_monetize :holdings, :total_profit_loss, currency: { present: false }
    add_column :holdings, :total_profit_loss_percentage, :float
    add_monetize :holdings, :price_change_1h, currency: { present: false }
    add_monetize :holdings, :price_change_24h, currency: { present: false }
    add_monetize :holdings, :price_change_7d, currency: { present: false }

    change_column :holdings, :amount, :integer, default: 0
  end
end
