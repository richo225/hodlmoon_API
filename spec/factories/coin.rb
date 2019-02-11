FactoryBot.define do
  factory :coin do
    sequence(:name) { |n| "Coin_#{n}" }
    symbol { Faker::Currency.unique.code }
  end
end
