require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, product_id: product.id)
    sleep(0.1)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'すべての情報が正しく入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end

      it '建物名が空でも登録できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it '郵便番号が空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end

      it '郵便番号にハイフン(-)が含まれていないと登録できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は、ハイフン（-）を含めて入力してください")
      end

      it '都道府県が空では登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県名を選択してください")
      end

      it '市区町村が空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end

      it '番地が空では登録できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("住所を入力してください")
      end

      it '電話番号が空だと登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end

      it '電話番号が11桁以内でないと登録できない' do
        @order_address.phone_number = '112233445566'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は、１０桁または１１桁で入力してください')
      end

      it '電話番号が半角の数値でないと登録できない' do
        @order_address.phone_number = '１１２２３３４４５５６'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は、１０桁または１１桁で入力してください')
      end

      it '電話番号は英数混合では登録できない' do
        @order_address.phone_number = '123a456b789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は、１０桁または１１桁で入力してください')
      end

      it 'ユーザーが空では登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("ユーザーIDを入力してください")
      end

      it '商品が空では登録できない' do
        @order_address.product_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("商品IDを入力してください")
      end

      it 'クレジットカード番号が空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end