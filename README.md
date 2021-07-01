# DB 設計

## users table

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| user_name          | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |


### Association

* has_many :products
* has_many :orders


## address table

| Column             | Type       | Options           |
|--------------------|------------|-------------------|
| postal_code        | string     | null: false       |
| prefecture_id      | integer    | null: false       |
| city               | string     | null: false       |
| address            | string     | null: false       |
| building_name      | string     | null: false       |
| phone_number       | string     | null: false       |
| order              | references | foreign_key: true |


### Association

* belongs_to :user
* has_one :order


## products table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| product_name      | string     | null: false       |
| description       | text       | null: false       |
| condition_id      | integer    | null: false       |
| price             | integer    | null: false       |
| trading_status_id | integer    | null: false       |
| category_id       | integer    | null: false       |
| shipping_fee_id   | integer    | null: false       |
| prefecture_id     | integer    | null: false       |
| user              | references | foreign_key: true |


### Association

* belongs_to :user
* has_one :order


## comments table

| Column | Type       | Options           |
|--------|------------|-------------------|
| text   | text       | null: false       |
| user   | references | foreign_key: true |


### Association

* belongs_to :user
* belongs_to :product


## orders table

| Column  | Type       | Options           |
|---------|------------|-------------------|
| user    | references | foreign_key: true |
| product | references | foreign_key: true |

* belongs_to :user
* belongs_to :product