# frozen_string_literal: true

module CoinMarketCap
  class RetrieveMarketData < Base
    def call
      HTTParty.get(uri, headers: headers)
    end

    private

    def uri
      "#{host}/v1/global-metrics/quotes/latest"
    end
  end
end
