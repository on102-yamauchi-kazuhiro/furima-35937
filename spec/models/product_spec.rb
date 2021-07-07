require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品の新規登録' do
    context '商品の新規登録ができるとき' do
      it '商品情報が存在すれば商品は保存される' do
        expect(@product).to be_valid
      end
    end
    context '商品の新規登録ができないとき' do
      it 'imageが空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが空では登録できない' do
        @product.product_name = '' # product_nameの値を空にする
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @product.description = '' # descriptionの値を空にする
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では登録できない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが「1」では登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では登録できない' do
        @product.condition_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idが「1」では登録できない' do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_fee_idが空では登録できない' do
        @product.shipping_fee_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'shipping_fee_idが「1」では登録できない' do
        @product.shipping_fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @product.prefecture_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが「1」では登録できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'trading_status_idが空では登録できない' do
        @product.trading_status_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Trading status can't be blank")
      end
      it 'trading_status_idが「1」では登録できない' do
        @product.trading_status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Trading status can't be blank")
      end
      it 'priceが空では登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円以下では登録できない' do
        @product.price = '150'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9,999,999円以上では登録できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが半角英数字混合では出品できない' do
        @product.price = '10000a'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英字では出品できない' do
        @product.price = 'abcde'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが全角文字では出品できない' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
      it 'ユーザーが紐づいていなければ投稿できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
