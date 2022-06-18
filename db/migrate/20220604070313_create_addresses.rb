class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references  :order,              null: false, foreign_key: true
      t.string      :postal_code,        null: false
      t.integer     :prefecture_id,      null: false
      t.string      :municipality,       null: false
      t.string      :address,            null: false
      t.string      :building_name
      # ↑任意のものについてはオプション不要カンマを外し忘れのないようにしましょう
      t.string      :telephone_number,   null: false
      t.timestamps
    end
  end
end
