class CoinSerializer
  include FastJsonapi::ObjectSerializer

  cache_options enabled: true, cache_length: 7.days
  attributes :name, :symbol, :cmc_rank

  attribute :icon_url do |coin|
    Rails.application.routes.url_helpers.url_for(coin.icon)
  end
end
