## usersTable

| Column            | Type        | Options                         |
| ------------------|-------------| --------------------------------|
| nickname          | string      | null: false                     |
| email             | string      | null: false, unique: true       |
| encrypted_password| string      | null: false                     |
| first_name        | string      | null: false                     |
| last_name         | string      | null: false                     |
| first_name_kana   | string      | null: false                     |
| last_name_kana    | string      | null: false                     |
| birthday          | date        | null: false                     |

### Association
has_many :items
has_many :order

## itemsTable

| Column            | Type        | Options                         |
| ------------------|-------------| --------------------------------|
| user              | references  | null: false, foreign_key: true  |
| item_name         | string      | null: false                     |
| item_text         | text        | null: false                     |
| category_id       | integer     | null: false                     |
| situation_id      | integer     | null: false                     |
| delivery_charge_id| integer     | null: false                     |
| prefecture_id     | integer     | null: false                     |
| delivery_date_id  | integer     | null: false                     |
| price             | integer     | null: false                     |

### Association
belongs_to :user
has_one :order

## orderｓTable

| Column            | Type        | Options                         |
| ------------------|-------------| --------------------------------|
| user              | references  | null: false, foreign_key: true  |
| item              | references  | null: false, foreign_key: true  |

### Association
belongs_to :user
belongs_to :item
has_one :address

## addressesTable

| Column            | Type        | Options                         |
| ------------------|-------------| --------------------------------|
| order             | references  | null: false, foreign_key: true  |
| postal_code       | string      | null: false                     |
| prefecture_id     | integer     | null: false                     |
| municipality      | string      | null: false                     |
| address           | string      | null: false                     |
| building_name     | string      |                                 |
| telephone_number  | string      | null: false                     |

### Association
belongs_to :order

ゴール：投稿が無い時ダミーデータ

行うために、条件分岐
１、投稿がゼロ
itemsテーブルのデータがない時
@item = Item.includes(:user).order("created_at DESC") itemsテーブルの情報取ってきている
@item = []、@itemがorderじゃないとき