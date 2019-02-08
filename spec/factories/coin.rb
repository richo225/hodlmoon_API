FactoryBot.define do
  factory :coin do
    sequence(:name) { |n| "Coin_#{n}" }
    alpha Faker::Currency.unique.code
  end
end
