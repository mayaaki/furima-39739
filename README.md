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
| birth_date         | string | null: false               |


### Association
- has_many :items
- has_many :orders
- has_one :address




## itemsテーブル

| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ------------------------------|
| item_name              | string     | null: false                   |
| item_text              | text       | null: false                   |
| item_category          | string     | null: false                   |
| item_condition         | string     | null: false                   |
| shipping_responsibility| string     | null: false                   |
| origin_location        | string     | null: false                   |
| days_to_ship           | string     | null: false                   |
| price                  | integer    | null: false                   |
| user                   | references | null: false, foreign_key: true|
| address                | references | null: false, foreign_key: true|

### Association
- belongs_to :address
- belongs_to :user
- has_one :order




## addressesテーブル

| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ------------------------------|
| postal_code            | string     | null: false                   |
| pref                   | string     | null: false                   |
| city                   | string     | null: false                   |
| street                 | string     | null: false                   |
| building               | string     |                               |
| tel                    | string     | null: false                   |
| user                   | references | null: false, foreign_key: true|

### Association
- has_many :orders
- has_many :items
- belongs_to :user



## ordersテーブル
| Column             | Type      | Options                       |
| ------------------ | --------- | ------------------------------|
| user               | references| null: false, foreign_key: true|
| item               | references| null: false, foreign_key: true|
| address            | references| null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :address
