FactoryBot.define do
  factory :frame do
    sequence(:name, 100) { 'frame' }
    sequence(:description, 100) { 'frame' }
    sequence(:price, 100) { 12 }
    price_currency { %w[GBP USD EUR JOD JPY].sample }
    stock { 12 }
    status { %w[Active inactive].sample }
  end
end
