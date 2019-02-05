FactoryBot.define do
  factory :portfolio do
    user { create(:user) }
  end
end
