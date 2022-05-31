class ItemsController < ApplicationController
  before_action :authenticate_user!,only: :new

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

private
  def item_params
    params.require(:item).permit(:item_name, :item_text, :category_id,:situation_id,:delivery_charge_id,:prefecture_id,:delivery_date_id,:price,:image).merge(user_id: current_user.id)
  end

end
