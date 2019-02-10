# frozen_string_literal: true

class RetrieveCoins
  def self.call
    new.call
  end

  def initialize; end

  def call
    HTTParty.get(uri, headers: headers)
  end

  private

  def uri
    "#{host}/v1/cryptocurrency/listings/latest?sort=market_cap&start=1"
  end

  def host
    'https://sandbox-api.coinmarketcap.com'
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
