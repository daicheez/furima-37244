FactoryBot.define do
  factory :order_buyer do
    postal_code { '123-4567'}
    prefecture_id { 2 }
    city { '福岡市' }
    address { '0-0-1' }
    building { '福岡タワー' }
    phone_number { '09012345678' }
  end
end
