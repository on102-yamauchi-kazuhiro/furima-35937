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
        expect(@product.errors.full_messages).to include("画像を入力してください")
      end
      it 'product_nameが空では登録できない' do
        @product.product_name = '' # product_nameの値を空にする
        @product.valid?
        expect(@product.errors.full_messages).to include("商品名を入力してください")
      end
      it 'descriptionが空では登録できない' do
        @product.description = '' # descriptionの値を空にする
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idが空では登録できない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'category_idが「1」では登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'condition_idが空では登録できない' do
        @product.condition_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の状態を選択してください")
      end
      it 'condition_idが「1」では登録できない' do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の状態を選択してください")
      end
      it 'shipping_fee_idが空では登録できない' do
        @product.shipping_fee_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it 'shipping_fee_idが「1」では登録できない' do
        @product.shipping_fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it 'prefecture_idが空では登録できない' do
        @product.prefecture_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it 'prefecture_idが「1」では登録できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it 'trading_status_idが空では登録できない' do
        @product.trading_status_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it 'trading_status_idが「1」では登録できない' do
        @product.trading_status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it 'priceが空では登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格を入力してください")
      end
      it 'priceが300円以下では登録できない' do
        @product.price = 150
        @product.valid?
        expect(@product.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end
      it 'priceが9,999,999円以上では登録できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
      end
      it 'priceが半角英数字混合では出品できない' do
        @product.price = '10000a'
        @product.valid?
        expect(@product.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'priceが半角英字では出品できない' do
        @product.price = 'abcde'
        @product.valid?
        expect(@product.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'priceが全角文字では出品できない' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'ユーザーが紐づいていなければ投稿できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
