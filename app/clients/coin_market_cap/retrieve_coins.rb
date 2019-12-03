# frozen_string_literal: true

module CoinMarketCap
  class RetrieveCoins < Base
    def call
      HTTParty.get(uri, headers: headers)
    end

    private

    def uri
      "#{host}/v1/cryptocurrency/listings/latest?sort=market_cap&start=1"
    end
  end
end
