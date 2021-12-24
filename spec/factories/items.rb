FactoryBot.define do
  factory :item do
    transient do
      gimei { Gimei.name }
    end
    item_name       { gimei.kanji }
    item_detail     { '詳細です。' + Faker::Lorem.sentence }
    category_id     { 2 }
    condition_id    { 2 }
    shipping_fee_id { 2 }
    prefecture_id   { 2 }
    shipping_day_id { 2 }
    price           { Faker::Number.between(from: 300, to: 9999999) }
  end
end
