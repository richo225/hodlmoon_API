FactoryBot.define do
  factory :order do
    process 'buy'
    coin { create(:coin) }
    amount 5
    currency 'GBP'
    exchange 'exchange'
    portfolio { create(:portfolio) }
  end
end
