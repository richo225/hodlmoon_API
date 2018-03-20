class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :coin
      t.integer :amount
      t.string :currency
      t.string :exchange

      t.timestamps
    end
  end
end
