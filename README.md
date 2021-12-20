## userテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| kanji_name         | string | null: false |
| kana_name          | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :item
- has_one :purchase_record


## itemsテーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| item_name     | string  | null: false |
| item_detail   | text    | null: false |
| category      | string  | null: false |
| condition     | string  | null: false |
| shipping_fee  | integer | null: false |
| shipping_from | string  | null: false |
| shipping_days | integer | null: false |
| price         | integer | null: false |

### Association
- belongs_to :user
- has_one :purchase_record


## purchase_recordテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |
| buyer_id | references | null: false, foreign_key: true |

### Association
- has_one :uer
- has_one :item
- has_one :buyer


## buyerテーブル

| Column         | Type    | Options                   |
| -------------- | ------- | ------------------------- |
| postal_code    | integer | null: false |
| prefectures    | string  | null: false |
| municipalities | string  | null: false |
| address        | string  | null: false |
| building       | string  | null: false |
| phone_number   | integer | null: false, unique: true |

### Association
- has_one :purchase_record
