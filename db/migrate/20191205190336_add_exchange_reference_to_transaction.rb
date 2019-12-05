class AddExchangeReferenceToTransaction < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :exchange
    add_reference :transactions, :exchange, foreign_key: true
  end
end
