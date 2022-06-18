class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  # 子供が多のため記述

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  validates :first_name, presence: true,format: { with: /\A[ぁ-んァ-ヶー一-龠々]+\z/, }
  # /ここに正規表現を書く/
  # 全角にする貼りデージョン
  validates :last_name, presence: true,format: {with: /\A[ぁ-んァ-ヶー一-龠々]+\z/,}
  validates :first_name_kana, presence: true,format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,}
  # 半角にするバリデーション
  validates :last_name_kana, presence: true,format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,}
  validates :birthday, presence: true

end
