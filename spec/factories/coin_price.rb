FactoryBot.define do
  factory :coin_price do
    coin
    market_cap { 3120 }
    volume_24h { 3120 }
    percent_change_1h { 0.3 }
    percent_change_24h { 1.2 }
    percent_change_7d { 1.2 }
    price { 2.32 }
  end
end
