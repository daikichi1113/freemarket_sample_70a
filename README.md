# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## usersテーブル
|Column|Type|Options|
|nickname|string|null: false|
|mail|string|null: false, unique: true, index: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_kana|string|null: false|
|first_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|

### Assosiation
- has_one :credit_card, dependent: :destroy
- has_one :sending_destination, dependent: :destroy
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
- has_many :seller_items, foreign_key: "seller_id", class_name: "items"

## credit_cardsテーブル
|Column|Type|Options|
|card_number|integer|null: false|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user|references|null: false, foreign_key: true|

### Assosiation
- belongs_to :user

## sending_destinationsテーブル
|Column|Type|Options|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|phone_number|integer|null: false|
|user|references|null: false, foreign_key: true|

### Assosiation
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|image|string|null: false|
|name|string|null: false|
|price|integer|null: false|
|item_description|string|
|item_condition|references|null: false, foreign_key: true|
|postage_payer|references|null: false, foreign_key: true|
|preparation_day|references|null: false, foreign_key: true|
|buyer|references|null: false, foreign_key: true|
|seller|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|

### Assosiation
- belongs_to :category
- belongs_to :brand
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :preparation_day

## categoriesテーブル
|Column|Type|Options|
|name|string|null: false|

### Assosiation
- has_many :items

## brandsテーブル
|Column|Type|Options|
|name|string|null: false|

### Assosiation
- has_many :items
