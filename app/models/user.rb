class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases
  validates :nickname, presence: true
  # validates :encrypted_password
  #   format: {
  #   with:  /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  #   message: :  ""
  #   }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  validates :first_name, presence: true,format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/, }
  validates :last_name, presence: true,format: {with: /\A[ぁ-んァ-ヶー一-龠]+\z/,}
  validates :first_name_kana, presence: true,format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,}
  validates :last_name_kana, presence: true,format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,}
  validates :birthday, presence: true

end
