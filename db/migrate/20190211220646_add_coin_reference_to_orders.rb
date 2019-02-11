class AddCoinReferenceToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :coin, foreign_key: true
    drop_table :portfolios do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
