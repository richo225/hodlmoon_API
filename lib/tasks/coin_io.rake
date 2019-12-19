# frozen_string_literal: true

namespace :coin_io do
  desc 'Update coins with coin_io ids'
  task :update_coin_ids, [:path] => :environment do |_t, args|
    COIN_IO_FILE = args[:path] || 'lib/import/coin_io.json'

    start_time = Time.now

    puts 'Loading JSON file.........'
    file = File.open(COIN_IO_FILE)
    data = JSON.load(file)

    puts 'Filtering JSON by symbol.........'
    data.select! { |a| Coin.pluck(:symbol).include?(a['symbol']) }

    puts 'Iterating through resulting coinio_data........'
    data.each do |d|
      coin = Coin.find_by(symbol: d['symbol'])
      next unless coin

      coin.update!(coinio_id: d['id'])
      puts "Coin #{d['symbol']} updated with coinio_id #{d['id']}"
    end

    puts 'Closing JSON file........'
    file.close

    puts "Completed in #{Time.now - start_time} seconds"
  end
end
