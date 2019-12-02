# frozen_string_literal: true

namespace :coins do
  desc 'Retrieve the latest coins from CoinMarkertCap and write to file'
  task :write_to_file, [:path] => :environment do |_t, args|
    FILE_PATH = args[:path] || 'lib/import/coins.json'

    start_time = Time.now

    puts 'Retrieving coins from CoinMarketCap.....'
    coins = RetrieveCoins.call.parsed_response['data']

    puts "#{coins.count} total coins found"

    puts "Writing coins to #{FILE_PATH}"
    json = JSON.pretty_generate(coins)
    File.open(FILE_PATH, 'w') { |f| f.write(json) }

    puts "Completed in #{Time.now - start_time} seconds"
  end

  desc 'Retrieve the latest coins from CoinMarkertCap and update db'
  task update_db: :environment do
    COIN_COLUMNS = %i(
      id
      name
      symbol
      slug
      circulating_supply
      total_supply
      max_supply
      cmc_rank
    ).freeze

    start_time = Time.now

    puts 'Retrieving coins from CoinMarketCap.....'
    coins = RetrieveCoins.call.parsed_response['data']

    puts "#{coins.count} total coins found"

    puts 'Importing coins to database......'
    values = coins.map(&:symbolize_keys)

    UPSERT_COLUMNS = COIN_COLUMNS - [:id]

    Coin.import(
      COIN_COLUMNS,
      values,
      on_duplicate_key_update: { conflict_target: [:id], columns: UPSERT_COLUMNS }
    )

    puts "Completed in #{Time.now - start_time} seconds"
  end
end
