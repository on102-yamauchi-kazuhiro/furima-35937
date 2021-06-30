# DB 設計

## users table

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_date         | string | null: false |



### Association

* has_many :products
* has_many :orders


## providers table

| Column   | Type       | Options           |
|----------|------------|-------------------|
| provider | string     | null: false       |
| user     | references | foreign_key: true |


### Association

* belongs_to :user


## products table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| product_name      | string     | null: false       |
| description       | text       | null: false       |
| condition_id      | integer    | null: false       |
| price             | integer    | null: false       |
| trading_status_id | integer    | null: false       |
| category_id       | integer    | foreign_key: true |
| shipping_id       | integer    | foreign_key: true |
| user_id           | integer    | foreign_key: true |


### Association

* belongs_to :user
* belongs_to :category
* has_many :product_images
* has_one :order
* has_one :shipping


## comments table

| Column | Type       | Options           |
|--------|------------|-------------------|
| text   | text       | null: false       |
| user   | references | foreign_key: true |


### Association

* belongs_to :user


## orders table

| Column     | Type       | Options           |
|------------|------------|-------------------|
| user_id    | references | foreign_key: true |
| product_id | references | foreign_key: true |

* belongs_to :user
* belongs_to :product