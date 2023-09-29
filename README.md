# テーブル設計

## users テーブル

| Column             | Type   | Options              |
| ------------------ | ------ | -----------          |
| nickname           | string | NOT NULL             |
| email              | string | NOT NULL,ユニーク制約 |
| password           | string | NOT NULL             |
| real_name          | string | NOT NULL             |
| main_name          | string | NOT NULL             |
| date_of_birth      | string | NOT NULL             |



### Association

- has_many :items
- has_many :buys



## items テーブル

| Column            | Type         | Options              |
| ------            | ------       | -----------          |
| image             |              |                      |
| title             | string       | NOT NULL             |
| explanation       | text         | NOT NULL             |
| category          | string       | NOT NULL             |
| situation         | string       | NOT NULL             |
| liability         | string       | NOT NULL             |
| area              | string       | NOT NULL             |
| delivery_days     | string       | NOT NULL             |
| price             | string       | NOT NULL             |
| item_user_id      | references   | NOT NULL,外部キー    |



### Association

- has_one :buy
- belongs_to :user



## buys テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| buy_user_id | references | NOT NULL,外部キー               |
| item_id     | references | NOT NULL,外部キー               |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item



## addresses テーブル

| Column            | Type         | Options              |
| ------            | ------       | -----------          |
| post_code         | string       | NOT NULL             |
| prefectures       | string       | NOT NULL             |
| municipalities    | string       | NOT NULL             |
| street_address    | string       | NOT NULL             |
| building_name     | string       | NOT NULL             |
| telephone_number  | string       | NOT NULL             |
| buy_id            | references   | NOT NULL,外部キー    |



### Association

- belongs_to :buy