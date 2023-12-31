# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | -----------             |
| nickname           | string | null: false             |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false             |
| real_last_name     | string | null: false             |
| real_first_name    | string | null: false             |
| main_last_name     | string | null: false             |
| main_first_name    | string | null: false             |
| date_of_birth      | date   | null: false             |



### Association

- has_many :items
- has_many :orders



## items テーブル

| Column            | Type         | Options                          |
| ------            | ------       | -----------                      |
| title             | string       | null: false                      |
| explanation       | text         | null: false                      |
| category_id       | integer      | null: false                      |
| situation_id      | integer      | null: false                      |
| liability_id      | integer      | null: false                      |
| prefecture_id     | integer      | null: false                      |
| delivery_days_id  | integer      | null: false                      |
| price             | integer      | null: false                      |
| user              | references   | null: false,foreign_key: true    |



### Association

- has_one :order
- belongs_to :user



## orders テーブル

| Column      | Type       | Options                                  |
| -------     | ---------- | ------------------------------           |
| user        | references | null: false,foreign_key: true            |
| item        | references | null: false,foreign_key: true            |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item



## addresses テーブル

| Column            | Type         | Options                        |
| ------            | ------       | -----------                    |
| post_code         | string       | null: false                    |
| prefecture_id     | integer      | null: false                    |
| municipalities    | string       | null: false                    |
| street_address    | string       | null: false                    |
| building_name     | string       |                                |
| telephone_number  | string       | null: false                    |
| order               | references   | null: false,foreign_key: true  |



### Association

- belongs_to :order