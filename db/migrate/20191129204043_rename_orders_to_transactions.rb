class RenameOrdersToTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_reference :orders, :user, index: true, foreign_key: true
    remove_reference :orders, :coin, index: true, foreign_key: true

    rename_table :orders, :transactions

    add_reference :transactions, :user, index: true, foreign_key: true
    add_reference :transactions, :coin, index: true, foreign_key: true
  end
end
