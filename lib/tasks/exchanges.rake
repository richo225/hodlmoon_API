namespace :exchanges do
  desc 'Seed the db with exchanges'
  task seed_db: :environment do
    start_time = Time.now

    EXCHANGE_NAMES = %w(
      HitBTC
      Huobi Global
      Binance
      Bitfinex
      Kraken
      OKEx
      Coinbase Pro
      Bittrex
      DigiFinex
      Bithumb
      Bitstamp
      MXC
      KuCoin
      ZBG
      Poloniex
      Gate.io
      Liquid
      LakeBTC
      Exmo
      BigONE
      Gemini
      OKCoin
      CoinEx
      Lykke Exchange
      Coineal
      Coinone
      Exrates
      Bibox
      IDAX
      Bitlish
      ZB.COM
      CoinBene
      LBank
      Korbit
      BitBay
      Bitbank
      P2PB2B
      IDEX
      FCoin
      OceanEx
      Bitso
      BitForex
      C2CX
      BitMart
      BTC Markets
      Coincheck
      Coinfloor
      Binance Jersey
      Luno
      STEX
      Livecoin
      YoBit
      The Rock Trading
      COSS
      SouthXchange
      EXX
      BTC-Alpha
      VinDAX
      Tidex
      Coinsuper
    ).freeze

    puts 'Importing exchanges to database......'
    Exchange.import([:name], EXCHANGE_NAMES.map { |item| [item] })

    puts "Completed in #{Time.now - start_time} seconds"
  end
end
