FactoryBot.define do
  factory :item do
    association :user
    item_name {Faker::Lorem.word}
    item_text {Faker::Lorem.characters}
    category_id {Faker::Number.between(from: 1, to: 10)}
    situation_id{Faker::Number.between(from: 1, to: 6)}
    delivery_charge_id{Faker::Number.between(from: 1, to: 2)}
    prefecture_id{Faker::Number.between(from: 1, to: 47)}
    delivery_date_id{Faker::Number.between(from: 1, to: 3)}
    price{Faker::Number.between(from: 300, to: 9999999)}
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end