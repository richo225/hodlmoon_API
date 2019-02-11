FactoryBot.define do
  factory :order do
    process 'buy'
    coin { create(:coin) }
    amount 5
    price 2.23
    exchange 'exchange'
    user { create(:user) }
  end
end
