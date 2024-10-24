# README
# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              | 
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | date   | null: false              |

### Association
- has_many :items
- has_many :buyer_records



## items テーブル
 
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| name             | string     | null: false                     |
| exp              | text       | null: false                     |
| category_id      | integer    | null: false                     |
| situation_id     | integer    | null: false                     |
| freight_id       | integer    | null: false                     |
| dep_place_id     | integer    | null: false                     |
| schedule_date_id | integer    | null: false                     |
| price            | integer    | null: false                     |
| user             | references | null: false, foreign_key: true  |

### Association
- has_one :buyer_record
- belongs_to :user
## buyer_records テーブル
| Column    | Type       | Options                         |
| ------    | ---------- | ------------------------------- |
| user      | references | null: false, foreign_key: true  |
| item      | references | null: false, foreign_key: true  |

### Association
- belongs_to :item
- has_one :address
- belongs_to :user

## addresses テーブル
| Column       | Type       | Options                         |
| ------       | ---------- | ------------------------------- |
| post_no      | string     | null: false                     |
| dep_place_id | integer    | null: false                     |
| city         | string     | null: false                     |
| city_no      | string     | null: false                     |
| building     | string     |                                 |
| phone_no     | string     | null: false                     |
| buyer_record | references | null: false, foreign_key: true  |

### Association
- belongs_to :buyer_record

