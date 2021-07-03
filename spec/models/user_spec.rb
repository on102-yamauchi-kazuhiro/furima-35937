require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'user_nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'user_nameが存在すれば登録できる' do
        @user.user_name = 'aaaaaa'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上の半角英数字混合であれば登録できる' do
        @user.password = 'abc000'
        @user.password_confirmation = 'abc000'
        expect(@user).to be_valid
      end
      it 'last_nameが存在すれば登録できる' do
        @user.last_name = 'ああああ'
        expect(@user).to be_valid
      end
      it 'first_nameが存在すれば登録できる' do
        @user.first_name = 'ああああ'
        expect(@user).to be_valid
      end
      it 'last_name_kanaが存在すれば登録できる' do
        @user.last_name_kana = 'アアアア'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが存在すれば登録できる'do
        @user.first_name_kana = 'アアアア'
        expect(@user).to be_valid
      end
      it 'birth_dateが存在すれば登録できる' do
        @user.birth_date = '2000-01-01'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'user_nameが空では登録できない' do
        @user.user_name = '' # user_nameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("User name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = '' # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailの@無しでは登録できない' do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = '' # passwordの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = '' # passwordの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00aaa'
        @user.password_confirmation = '000aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数混合でないと登録できない' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = '' # user_nameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
