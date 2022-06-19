class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number
  # バリデーションをかけるものがあるときに上記で宣言することで条件を記載することができる(条件は下記に)
  # バリデーションをかけない(例：任意で入力するデータ)のようなものがあったとしても上記には記入は必要(データを扱うには記述必須)
  # controller→model (MVCの流れで考えてみるとわかりやすい）

  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}  
  # 都道府県のプルダウン０番だとバリデーションをかけます

  with_options presence: true do
    #  order modelでのバリデーションを追加してます
    validates :token
    validates :user_id
    validates :item_id
    # ↓address modelでのバリデーションを追加してます。
    validates :postal_code
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :telephone_number
    # 情報が空だったらバリデーションをかける
  end

  validates :postal_code,format: {with: /\A\d{3}[-]\d{4}\z/}
  # 郵便番号、３桁ー４桁のバリデーションを追加しています。
  validates :telephone_number,format: {with: /\A\d{10,11}\z/}
  # ↑電話番号バリデーションは10桁あるいは11桁になります


  def save
    # 寄付情報を保存し、変数orderに代入する
    order = Order.create(user_id: user_id ,item_id: item_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number)
      # アドレス情報を作成する問いにカラムに対して値を書くことで(カラム:値,)(キーとバリューの関係(データ保存)) OrderAddress_idに紐づくデータを作成保存できる。
  end
  # ↑なぜseveをmodelで宣言されているかsaveを使うことで記述が簡単になる。二つのテーブルに保存する処理だから(form object)を書いている
  # 可読性があがる(参考にできるところがoictweetのsearch機能)
end

  # validates :telephone_number,format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}
  # validates :telephone_number,format: {with: \A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z}
  # validates :telephone_number,format: {with: \A0[5789]0[-]?\d{4}[-]?\d{4}\z}
  # ↑電話番号のバリデーション今回は使用しない(参考資料で残す)