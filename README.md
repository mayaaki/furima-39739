# README

# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |


### Association
- has_many :items
- has_many :orders




## itemsテーブル

| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ------------------------------|
| item_name              | string     | null: false                   |
| item_text              | text       | null: false                   |
| category_id            | integer    | null: false                   |
| satatus_id             | integer    | null: false                   |
| responsibility_id      | integer    | null: false                   |
| prefecture_id          | integer    | null: false                   |
| schedule_delivery_id   | integer    | null: false                   |
| price                  | integer    | null: false                   |
| user                   | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order




## addressesテーブル

| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ------------------------------|
| postal_code            | string     | null: false                   |
| pref_id                | integer    | null: false                   |
| city                   | string     | null: false                   |
| street                 | string     | null: false                   |
| building               | string     |                               |
| tel                    | string     | null: false                   |
| oder                   | references | null: false, foreign_key: true|

### Association
- belongs_to :order





## ordersテーブル
| Column             | Type      | Options                       |
| ------------------ | --------- | ------------------------------|
| user               | references| null: false, foreign_key: true|
| item               | references| null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item
- has_one :address
