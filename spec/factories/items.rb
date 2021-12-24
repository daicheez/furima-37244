FactoryBot.define do
  factory :item do
    item_name              { Faker::Name.name }
    item_detail                 { Faker::Internet.free_email }
    category { password }
    first_name            { person.first.kanji }
    last_name             { person.last.kanji }
    first_name_kana       { person.first.katakana }
    last_name_kana        { person.last.katakana }
    birth_day             { Faker::Date.between(from: '1930-1-1', to: '2016-12-31') }
  end
end
