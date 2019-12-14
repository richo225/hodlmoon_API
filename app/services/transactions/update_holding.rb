module Transactions
  class UpdateHolding
    def self.call(transaction:)
      new(transaction: transaction).call
    end

    def initialize(transaction:)
      @transaction = transaction
    end

    def call
      holding.increment!('total_amount', transaction_amount)
      holding.reload
      holding.update!(
        total_price: total_price,
        total_profit_loss: total_profit_loss,
        total_profit_loss_percentage: total_profit_loss_percentage,
        price_change_1h: price_change_1h,
        price_change_24h: price_change_24h,
        price_change_7d: price_change_7d
      )
    end

    private

    attr_accessor :transaction

    def user
      @user ||= User.find(transaction.user_id)
    end

    def coin
      @coin ||= Coin.find(transaction.coin_id)
    end

    def holding
      @holding ||= Holding.find_or_create_by(user: user, coin: coin)
    end

    def transaction_amount
      transaction.buy? ? transaction.amount : -transaction.amount
    end

    def total_price
      holding.total_amount * coin.coin_price.price
    end

    def total_profit_loss
      (total_sells - total_buys) + total_price
    end

    def total_profit_loss_percentage
      (total_profit_loss / total_buys) * 100
    end

    def total_buys
      user.transactions.for_coin(coin).buy.map(&:total_price).sum
    end

    def total_sells
      user.transactions.for_coin(coin).sell.map(&:total_price).sum
    end

    def price_change_1h
      total_price * (coin.coin_price.percent_change_1h / 100)
    end

    def price_change_24h
      total_price * (coin.coin_price.percent_change_24h / 100)
    end

    def price_change_7d
      total_price * (coin.coin_price.percent_change_7d / 100)
    end
  end
end
