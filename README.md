# DB 設計

## users table

| Column          | Type   | Options     |
|-----------------|--------|-------------|
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_year      | string | null: false |
| birth_month     | string | null: false |
| birth_day       | string | null: false |


### Association

* has_many :items
* has_many :comments
* has_many :messages
* has_many :orders


## providers table

| Column   | Type       | Options           |
|----------|------------|-------------------|
| provider | string     | null: false       |
| user     | references | foreign_key: true |


### Association

* belongs_to :user


## products table

| Column         | Type       | Options           |
|----------------|------------|-------------------|
| product_name   | string     | null: false       |
| description    | text       | null: false       |
| condition      | integer    | null: false       |
| price          | integer    | null: false       |
| trading_status | integer    | null: false       |
| completed_at   | datetime   | null: false       |
| category       | references | foreign_key: true |
| shipping_id    | references | foreign_key: true |
| brand          | references | foreign_key: true |
| seller_id      | references | foreign_key: true |


### Association

* belongs_to :user
* belongs_to :category
* belongs_to :brand
* has_many :likes
* has_many :reviews
* has_many :product_images
* has_one :order
* has_one :shipping


## brands table

| Column   | Type       | Options           |
|----------|------------|-------------------|
| category | references | foreign_key: true |
| brand    | references | foreign_key: true |
| name     | string     | null: false       |


### Association

* has_many :item
* belongs_to :brand_group
* belongs_to :category


## comments table

| Column | Type       | Options           |
|--------|------------|-------------------|
| text   | text       | null: false       |
| user   | references | foreign_key: true |


### Association

* belongs_to :user