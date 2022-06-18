class Order < ApplicationRecord
  # attr_accessor :token
  # ↑上記の内容はフォームオブジェクトを作成した際に移動した

  belongs_to :user
  belongs_to :item
  has_one :address

  # validates :price, presence: true
  # 購入金額の入力が必須

  # ↑フォームオブジェクトの為コメントアウトしてorder_address.rbに移動
end
