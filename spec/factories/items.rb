FactoryBot.define do
  factory :item do
    association :user
    item_name {Faker::Lorem.word}
    item_text {Faker::Lorem.characters}
    category_id {Faker::Number.between(from: 2, to: 11)}
    situation_id{Faker::Number.between(from: 2, to: 7)}
    delivery_charge_id{Faker::Number.between(from: 2, to: 2)}
    prefecture_id{Faker::Number.between(from: 2, to: 47)}
    delivery_date_id{Faker::Number.between(from: 2, to: 4)}
    price{Faker::Number.between(from: 300, to: 9999999)}
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end