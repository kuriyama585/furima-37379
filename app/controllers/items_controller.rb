class ItemsController < ApplicationController
  before_action :set_item,only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,only: [:new,:edit, :destroy]

def index
  @item = Item.includes(:user).order("created_at DESC")
  # itemテーブルから情報を持ってきています。
  # includes(:user)           itemのデータベースとuser情報も一緒に持っていきます。
  # order("created_at DESC")  投稿を新しいものから順番に表示する。
end

def new
  @item = Item.new
end

def create
  @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
end

def show
end

def edit
  unless  current_user.id == @item.user_id
  # 投稿者以外が遷移した時
  # unlessはもしもの逆の意味
    redirect_to action: :index
  end
  # ↑ログインかつ投稿者のみ遷移可能の条件
  # 課題はbefore_actionで条件をつけれるようにする
end

def update
  if @item.update(item_params)
    redirect_to item_path
  else
    render :edit
  end
end

def destroy 
  if  current_user.id == @item.user_id
    # もし投稿したページに投稿者が遷移した時
    @item.destroy
    # trueの時は削除実行その後下記の式に
    # falsuの時は削除を抜けて下記の式に
  end
  redirect_to root_path
end

private
  def item_params
    params.require(:item).permit(:item_name, :item_text, :category_id,:situation_id,:delivery_charge_id,:prefecture_id,:delivery_date_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
