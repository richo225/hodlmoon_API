# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :process
      t.string :coin
      t.integer :amount
      t.string :currency
      t.string :exchange

      t.references :coin, foreign_key: true
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
