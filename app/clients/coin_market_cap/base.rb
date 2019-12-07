# frozen_string_literal: true

module CoinMarketCap
  class Base
    def self.call
      new.call
    end

    def initialize; end

    def call
      raise NotImplementedError
    end

    private

    def uri
      raise NotImplementedError
    end

    def host
      ENV.fetch('COINMARKETCAP_URL')
    end

    def headers
      {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'X-CMC_PRO_API_KEY': api_key
      }
    end

    def api_key
      ENV.fetch('COINMARKETCAP_API_KEY')
    end
  end
end
