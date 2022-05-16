## groups_usersTable

| Column          | Type        | Options                         |
| ----------------|-------------| --------------------------------|
| user_id         | string      | null: false                     |
| nickname        | string      | null: false                     |
| email           | string      | null: false                     |
| password        | string      | null: false                     |
| first_name      | string      | null: false                     |
| last_name       | string      | null: false                     |
| first_name_kana | string      | null: false                     |
| last_name_kana  | string      | null: false                     |
| birthday        | date        | null: false                     |

### Association
- belongs_to :itemsTable
- belongs_to :purchasesTable

## groups_itemsTable

| Column          | Type        | Options                         |
| ----------------|-------------| --------------------------------|
| user_id         | references  | null: false, foreign_key: true  |
| item_id         | string      | null: false                     |
| item_name       | string      | null: false                     |
| item_text       | text        | null: false                     |
| item_img        | string      | null: false                     |
| category        | string      | null: false                     |
| situation       | string      | null: false                     |
| delivery_charge | string      | null: false                     |
| prefectures     | integer     | null: false                     |
| days            | date        | null: false                     |
| price           | integer     | null: false                     |

### Association
- belongs_to :userTable
- belongs_to :purchasesTable

## groups_purchasesTable

| Column          | Type        | Options                         |
| ----------------|-------------| --------------------------------|
| user_id         | references  | null: false, foreign_key: true  |
| item_id         | references  | null: false, foreign_key: true  |
| purchases_id    | string      | null: false                     |

### Association
- belongs_to :userTable
- belongs_to :itemsTable
- belongs_to :addressesTable

## groups_addressesTable

| Column          | Type        | Options                         |
| ----------------|-------------| --------------------------------|
| purchases_id    | references  | null: false, foreign_key: true  |
| address_id      | string      | null: false                     |
| postal_code     | string      | null: false                     |
| prefectures     | string      | null: false                     |
| municipality    | string      | null: false                     |
| address         | string      | null: false                     |
| building_name   | string      | null: false                     |
| telephone_number| string      | null: false                     |

### Association
- belongs_to :purchasesTable