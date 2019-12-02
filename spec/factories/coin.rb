FactoryBot.define do
  factory :coin do
    sequence(:name) { |n| "Coin_#{n}" }
    symbol { Faker::Currency.unique.code }
    icon { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test-icon.png'), 'image/png') }
  end
end
