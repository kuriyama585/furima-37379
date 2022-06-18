# factoryにuser_id.item_idを記述することはダメ
# 理由：その人がその商品を買うことしか再現できない。

# テストの網羅性が低い(テストがしっかりできない)
# 外部キーのカラム情報はファクトリーでは用意しない(referencesのもの)

# addressとorderの二つのテストをこのファイルとモデルファイルで活かっつで実施する。
FactoryBot.define do
  factory :order_address do
    postal_code {"123-4567"}
    # 海外の住所なので日本の基準です。→Faker::Address.postcode　　今回は文字列で対応する。
    # □トークン→→なんでもいい(カード番号、その他不要の考え)
    # □user_id→数字
    # □item_id→数字
    # item_id/user_id order_address_spec.rbのbefore内でダミーデータを生成しているため。
    token {Faker::Number.number(digits: 10)}
    prefecture_id {Faker::Number.between(from: 1, to: 47)}
    municipality{Faker::Address.street_address}
    address {Faker::Address.city}
    building_name {Faker::Lorem.word}
    telephone_number {Faker::Number.leading_zero_number(digits: 10)}
  end
end