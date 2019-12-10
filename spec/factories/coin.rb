FactoryBot.define do
  factory :coin do
    sequence(:name) { |n| "Coin_#{n}" }
    cmc_rank { 20 }
    symbol { Faker::Currency.unique.code }
    icon { Rack::Test::UploadedFile.new('spec/support/assets/test-icon.png', 'image/png') }
  end
end
