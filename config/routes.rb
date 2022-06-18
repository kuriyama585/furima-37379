Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # topページを決める記述(※二つ記載してはいけない)
  # resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  # resources :orders, only:[:index, :create]
  # ↑エラーでた時用、振り返り用で残す

  # resourcesはコントローラーごとに必要な記述になる。
  # indexアクションと、購入金額を記録するためのcreateアクションに対応するルーティングを設定

  resources :items do
    resources :orders, only:[:index, :create]
  end
  # doとendで挟むことにより、ルーティングの記述をネストさせることで
  # 商品ページに対しての購入機能という親子関係を表現したパスが、購入機能に必要なリクエストのパスになる

end