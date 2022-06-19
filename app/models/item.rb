class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_date

  belongs_to :user
  has_one :order

  #ジャンルの選択が「--」(---はid１のこと)の時は保存できないようにする 
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}  
  validates :situation_id, numericality: { other_than: 0 , message: "can't be blank"}  
  validates :delivery_charge_id, numericality: { other_than: 0 , message: "can't be blank"}  
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}  
  validates :delivery_date_id, numericality: { other_than: 0 , message: "can't be blank"}  
  # アクティブハッシュはカラムに対してバリデーションをかけないといけない。
  # 今回のプルダウン１がーーーになるが入力の時は１を選ばれないようにする。

  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :image, presence: true
  #外部のアクティブストレイジに関してもvalidationは書けることができる。
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_date_id, presence: true
  # presence: trueはデフォルトcant be blankと表示させる。

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end