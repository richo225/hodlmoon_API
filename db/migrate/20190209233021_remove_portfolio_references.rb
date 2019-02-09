class RemovePortfolioReferences < ActiveRecord::Migration[5.1]
  def change
    remove_reference :orders, :coin, foreign_key: true
    remove_reference :orders, :portfolio, foreign_key: true
    remove_reference :portfolios, :user, foreign_key: true
  end
end
