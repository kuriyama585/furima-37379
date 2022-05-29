require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe '商品出品機能' do
  context '新規登録できる場合' do
    it "全ての項目がが存在すれば登録できる" do
      expect(@item).to be_valid
    end
  end
    context '新規登録できない場合' do
      it "userが空では登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "item_nameが空では登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "item_textが空では登録できない" do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end
      it "category_id が空では登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "situation_idが空では登録できない" do
        @item.situation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it "delivery_charge_idが空では登録できない" do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it "prefecture_idが空では登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "delivery_date_idが空では登録できない" do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "category_idが0では登録できない" do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "situation_idが0では登録できない" do
        @item.situation_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it "delivery_charge_idが0では登録できない" do
        @item.delivery_charge_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it "prefecture_idが0では登録できない" do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "delivery_date_idが0では登録できない" do
        @item.delivery_date_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it 'priceは半角でないと登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは300未満は登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceは9999999超過は登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end