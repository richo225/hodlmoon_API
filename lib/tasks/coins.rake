# frozen_string_literal: true

namespace :coins do
  desc 'Retrieve the latest coins from CoinMarkertCap and seed db'
  task seed_db: :environment do
    start_time = Time.now

    puts 'Retrieving coins from CoinMarketCap.....'
    response = CoinMarketCap::RetrieveCoins.call.parsed_response['data']

    puts "#{response.count} total coins found"

    puts 'Importing coin data to database......'
    coins = []
    response.each do |d|
      coin = Coin.new(
        coinmarketcap_id: d['id'],
        name: d['name'],
        symbol: d['symbol'],
        slug: d['slug'],
        cmc_rank: d['cmc_rank']
      )

      coin.build_coin_price(
        price: d.dig('quote', 'GBP', 'price'),
        market_cap: d.dig('quote', 'GBP', 'market_cap'),
        volume_24h: d.dig('quote', 'GBP', 'volume_24h'),
        percent_change_1h: d.dig('quote', 'GBP', 'percent_change_1h'),
        percent_change_24h: d.dig('quote', 'GBP', 'percent_change_24h'),
        percent_change_7d: d.dig('quote', 'GBP', 'percent_change_7d')
      )

      coins << coin
    end

    Coin.import coins, recursive: true, validate: false

    puts "Completed in #{Time.now - start_time} seconds"
  end

  desc 'Retrieve the latest coins from CoinMarkertCap and update db'
  task update_db: :environment do
    start_time = Time.now

    puts 'Retrieving coins from CoinMarketCap.....'
    response = CoinMarketCap::RetrieveCoins.call.parsed_response['data']

    puts "#{response.count} total coins found"

    puts 'Importing coin price data to database......'
    response.each do |d|
      coin = Coin.find_by(coinmarketcap_id: d['id'])

      coin_price = CoinPrice.find_or_create_by(coin_id: coin.id)
      coin_price.update!(
        price: d.dig('quote', 'GBP', 'price'),
        market_cap: d.dig('quote', 'GBP', 'market_cap'),
        volume_24h: d.dig('quote', 'GBP', 'volume_24h'),
        percent_change_1h: d.dig('quote', 'GBP', 'percent_change_1h'),
        percent_change_24h: d.dig('quote', 'GBP', 'percent_change_24h'),
        percent_change_7d: d.dig('quote', 'GBP', 'percent_change_7d')
      )
    end

    puts "Completed in #{Time.now - start_time} seconds"
  end
end
