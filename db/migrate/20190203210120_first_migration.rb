class FirstMigration < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.timestamps
    end

    create_table :portfolios do |t|
      t.string :title
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end

    create_table :coins do |t|
      t.string :name
      t.string :alpha

      t.timestamps
    end

    create_table :orders do |t|
      t.string :process
      t.integer :amount
      t.string :currency
      t.string :exchange

      t.references :coin, foreign_key: true
      t.references :portfolio, foreign_key: true

      t.timestamps
    end

  end
end
