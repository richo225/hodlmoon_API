FactoryBot.define do
  factory :order do
    process 'buy'
    coin { create(:coin) }
    amount 5
    price 2.23
    exchange 'exchange'
    portfolio { create(:portfolio) }
  end
end
