FactoryBot.define do
  factory :portfolio do
    user { create(:user) }
    total_holdings_price { 125 }
    total_profit_loss { 35 }
    total_price_change_1h { 2 }
    total_price_change_24h { 5 }
    total_price_change_7d { 8 }
  end
end
