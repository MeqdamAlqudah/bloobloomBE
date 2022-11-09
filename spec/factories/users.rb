FactoryBot.define do
  factory :user do
    sequence(:name, 100) { |n| "user#{n}" }
    user_currency { %w[GBP USD EUR JOD JPY].sample }
  end
end
