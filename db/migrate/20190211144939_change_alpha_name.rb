# frozen_string_literal: true

class ChangeAlphaName < ActiveRecord::Migration[5.1]
  def change
    rename_column :coins, :alpha, :symbol
    add_column :coins, :slug, :string
    add_column :coins, :circulating_supply, :integer
    add_column :coins, :total_supply, :integer
    add_column :coins, :max_supply, :integer
    add_column :coins, :cmc_rank, :integer
  end
end
