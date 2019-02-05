FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@mail.com" }
    sequence(:password) { |n| "password#{n}" }
  end
end
