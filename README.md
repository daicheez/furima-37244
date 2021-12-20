## userテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| kanji_name         | string | null: false |
| kana_name          | string | null: false |
| birth_year         | date   | null: false |
| birth_month        | date   | null: false |
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
| prefectures_id   | integer | null: false |
| shipping_days_id | integer | null: false |
| price            | integer | null: false |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record


## purchase_recordテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association
- has_one :uer
- has_one :item


## buyerテーブル

| Column         | Type    | Options                   |
| -------------- | ------- | ------------------------- |
| postal_code    | string  | null: false |
| prefectures_id | integer | null: false |
| municipalities | string  | null: false |
| address        | string  | null: false |
| building       | string  |             |
| phone_number   | string  | null: false, unique: true |

### Association
- has_many :purchase_record
