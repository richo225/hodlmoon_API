FactoryBot.define do
  factory :exchange do
    sequence(:name) { |n| "Exchange_#{n}" }
  end
end
