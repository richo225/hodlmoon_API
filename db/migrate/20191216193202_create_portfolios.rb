class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.references :user, foreign_key: true
      t.monetize :total_holdings_price, default: 0, currency: { present: false }
      t.monetize :total_profit_loss, default: 0, currency: { present: false }
      t.float :total_profit_loss_percentage, default: 0
      t.monetize :total_price_change_1h, default: 0, currency: { present: false }
      t.monetize :total_price_change_24h, default: 0, currency: { present: false }
      t.monetize :total_price_change_7d, default: 0, currency: { present: false }
      t.float :total_price_change_1h_percentage, default: 0
      t.float :total_price_change_24h_percentage, default: 0
      t.float :total_price_change_7d_percentage, default: 0
      t.timestamps
    end
  end
end
