module Transactions
  class UpdatePortfolio
    def self.call(user:)
      new(user: user).call
    end

    def initialize(user:)
      @user = user
    end

    def call
      portfolio.update!(
        total_holdings_price: total_holdings_price,
        total_profit_loss: total_profit_loss,
        total_profit_loss_percentage: total_profit_loss_percentage,
        total_price_change_1h: total_price_change_1h,
        total_price_change_1h_percentage: total_price_change_1h_percentage,
        total_price_change_24h: total_price_change_24h,
        total_price_change_24h_percentage: total_price_change_24h_percentage,
        total_price_change_7d: total_price_change_7d,
        total_price_change_7d_percentage: total_price_change_7d_percentage
      )
    end

    private

    attr_accessor :user

    def portfolio
      @portfolio ||= Portfolio.find_or_create_by(user: user)
    end

    def holdings
      @holdings ||= user.holdings
    end

    def total_holdings_price
      holdings.map(&:total_price).sum
    end

    def total_profit_loss
      holdings.map(&:total_profit_loss).sum
    end

    def total_profit_loss_percentage
      (total_profit_loss / total_buys) * 100
    end

    def total_buys
      user.transactions.buy.map(&:total_price).sum
    end

    def total_sells
      user.transactions.sell.map(&:total_price).sum
    end

    def total_price_change_1h
      holdings.map(&:price_change_1h).sum
    end

    def total_price_change_1h_percentage
      (total_price_change_1h / total_holdings_price) * 100
    end

    def total_price_change_24h
      holdings.map(&:price_change_24h).sum
    end

    def total_price_change_24h_percentage
      (total_price_change_24h / total_holdings_price) * 100
    end

    def total_price_change_7d
      holdings.map(&:price_change_7d).sum
    end

    def total_price_change_7d_percentage
      (total_price_change_7d / total_holdings_price) * 100
    end
  end
end
