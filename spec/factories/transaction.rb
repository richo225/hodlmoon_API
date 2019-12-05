FactoryBot.define do
  factory :transaction do
    process { 'buy' }
    coin { create(:coin) }
    amount { 5 }
    price { 2.23 }
    exchange { create(:exchange) }
    user { create(:user) }
  end
end
