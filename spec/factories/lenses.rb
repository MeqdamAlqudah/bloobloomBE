FactoryBot.define do
  factory :lense do
    sequence(:colour) { |n| "foodItem#{n}" }
    sequence(:description) { |n| "foodItem#{n}" }
    prescription_type { %w[fashion single_vision varifocal].sample }
    lens_type { %w[classic blue_light transition].sample }
    sequence(:price) { |n| n }
    price_currency { %w[GBP USD EUR JOD JPY].sample }
    stock { 12 }
  end
end
