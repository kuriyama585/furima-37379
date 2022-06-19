require 'rails_helper'

# 注意点がaddressとorderのテストを一緒に実施するコードが必要
# ここは外部の内容は必要
# 単体テストであって結合テストではない

RSpec.describe OrderAddress, type: :model do
  describe '購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
      # □今回userのクリエイトを作っているのでitemも必要です
      # □FactoryBot.buildの内容も上記の内容と合わせる必要があります。
      # 今回の情報は大量にある（カリキュラム）
    end
      context '内容に問題ない場合' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@order_address).to be_valid
        end
        it 'building_nameは空でも保存できること' do
          @order_address.building_name = ''
          expect(@order_address).to be_valid
        end
      end
      # 上記は正常系
      # 下記は異常系
      context '内容に問題がある場合' do
      it 'user_idが空だと保存できないこと' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが空だと保存できないこと' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'postal_codeが3桁ハイフン4桁でないと保存できないこと' do
        @order_address.postal_code = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end
      it "prefecture_idが0では登録できない" do
        @order_address.prefecture_id = '0'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'telephone_numberが9桁以下では保存できないこと' do
        @order_address.telephone_number = '000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが11桁以上では保存できないこと' do
        @order_address.telephone_number = '000000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが半角数字以外が含まれている場合は保存できないこと' do
        @order_address.telephone_number = '００００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
      end
    end
  end
end
