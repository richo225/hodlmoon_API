FactoryBot.define do
  factory :holding do
    user
    coin
    total_amount { 3 }
    total_price { 125 }
    total_profit_loss { 35 }
    price_change_1h { 2 }
    price_change_24h { 5 }
    price_change_7d { 8 }
  end
end
