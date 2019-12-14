module Transactions
  class UpdateHolding
    def self.call(transaction:)
      new(transaction: transaction).call
    end

    def initialize(transaction:)
      @transaction = transaction
    end

    def call
      holding.increment!('amount', transaction_amount)
      holding.reload!
      holding.update!(
        total_price: total_price,
        total_profit_loss: total_profit_loss
      )
    end

    private

    attr_accessor :transaction

    def user
      @user ||= User.find(user_id)
    end

    def coin
      @coin ||= Coin.find(coin_id)
    end

    def holding
      @holding ||= Holding.find_or_create_by(user: user, coin: coin)
    end

    def transaction_amount
      transaction.buy? ? transaction.amount : -transaction.amount
    end

    def total_price
      holding.amount * coin.price
    end

    def total_profit_loss
      (total_buys - total_sells) + total_holding_price
    end

    def total_buys
      user.transactions.buy.map(&:total_price).sum
    end

    def total_sells
      user.transactions.sell.map(&:total_price).sum
    end
  end
end
