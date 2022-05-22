FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials}
    email {Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation {password}
    first_name{"鈴木"}
    last_name{"一郎"}
    first_name_kana{"スズキ"}
    last_name_kana{"イチロウ"}
    birthday{Faker::Date.in_date_period}
  end
end