class Address < ApplicationRecord
  belongs_to :order


  # validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}  

  # validates :postal_code, presence: true
  # validates :prefecture_id, presence: true
  # validates :municipality, presence: true
  # validates :address, presence: true
  # validates :telephone_number, presence: true

  # validates :address, presence: true,format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,}
  # validates :telephone_number, presence: true,format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,}
# ↑フォームオブジェクトの為コメントアウトしてorder_address.rbに移動
end
