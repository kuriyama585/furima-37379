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
has_many :purchases

## itemsTable

| Column            | Type        | Options                         |
| ------------------|-------------| --------------------------------|
| user              | references  | null: false, foreign_key: true  |
| item_name         | string      | null: false                     |
| item_text         | text        | null: false                     |
| category_id       | integer     | null: false                     |
| situation_id      | integer     | null: false                     |
| delivery_charge_id| integer     | null: false                     |
| prefectures_id    | integer     | null: false                     |
| delivery_date_id  | integer     | null: false                     |
| price             | integer     | null: false                     |

### Association
belongs_to :user
has_one :purchase

## purchasesTable

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
| purchase          | references  | null: false, foreign_key: true  |
| postal_code       | string      | null: false                     |
| prefectures_id    | integer     | null: false                     |
| municipality      | string      | null: false                     |
| address           | string      | null: false                     |
| building_name     | string      |                                 |
| telephone_number  | string      | null: false                     |

### Association
belongs_to :purchase