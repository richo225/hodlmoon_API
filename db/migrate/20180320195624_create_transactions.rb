class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :coin, null: false
      t.money :amount, null: false
      t.string :currency, null: false
      t.string :exchange, null: false

      t.timestamps
    end
  end
end
