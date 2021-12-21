## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| kanji_first_name   | string | null: false |
| kanji_last_name    | string | null: false |
| kana_first_name    | string | null: false |
| kana_last_name     | string | null: false |
| birth_day          | date   | null: false |

### Association
- has_many :items
- has_many :purchase_records


## itemsテーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| item_name        | string  | null: false |
| item_detail      | text    | null: false |
| category_id      | integer | null: false |
| condition_id     | integer | null: false |
| shipping_fee_id  | integer | null: false |
| prefecture_id    | integer | null: false |
| shipping_day_id  | integer | null: false |
| price            | integer | null: false |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record


## purchase_recordsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :buyer


## buyersテーブル

| Column         | Type    | Options                   |
| -------------- | ------- | ------------------------- |
| postal_code    | string  | null: false |
| prefecture_id  | integer | null: false |
| municipalities | string  | null: false |
| address        | string  | null: false |
| building       | string  |             |
| phone_number   | string  | null: false |
| purchase_record | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_record
