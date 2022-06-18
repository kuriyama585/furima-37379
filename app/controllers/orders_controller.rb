class OrdersController < ApplicationController
  before_action :authenticate_user!,only: :index

  # 今回orderテーブルとaddressesテーブルを一緒に保存する。
  # テストに関してもで一緒に行う
  # formオブジェクトが今回の処理の名称になる→同時保存
  def index
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
    # viewページに表示すために必要
    if  current_user.id == @item.user_id || @item.order
      # もし投稿したページに投稿者が遷移した時
      # 投稿者は購入されていてもされていなっくても遷移でいない
      # 商品が購入されていたらログインしている人は線できないようにする。
      # before_actionの影響があるのでログインしている人にこだわらなくても良い
      # 購入アクションができる前はログインユーザー（投稿者以外)が遷移できるようになっている
      redirect_to root_path
      # trueの時は削除実行その後下記の式に
      # falsuの時は削除を抜けて下記の式に
    end 
    # ↑Controlの中に入ったときに右側の式を確認しidではなくitem_idであることがわかった
    # inndexの中でのインスタンスを作成することでindexのビューで使用することがきる。
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    # binding.pry
    # ※↑後程発生
    # もしも購入ボタン押下→データ保存できない時表示が必要なため記述が必要である。
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
      #コントローラーが違う状態でもトップページに戻れる記述(アクションに限定されず全体で対応するもの)
    else
      render 'index'
      # 上記の内容は保存ができない時に購入ページに戻ります。
      # そのためクリエイトの中で表示するために@itemの記述が必要になる。
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end
  # パラムスはモデルと参照するカラムをプラーベートメソッドで宣言している。
  # mergeする時は子供の時に親の情報(userとitem)をmergeすることが必要である。(indexの表示ではなく保存のために必要)

  def pay_item
    Payjp.api_key = "sk_test_b91ccdb051f9feb13fab44d4"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  # def order_params
  #   params.require(:order).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number).merge(user_id: current_user.id)
  # end
  # フォームオブジェクトを追加するために上記の内容を削除
end