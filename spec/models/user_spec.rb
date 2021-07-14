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
      it 'first_name_kanaが存在すれば登録できる' do
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
        expect(@user.errors.full_messages).to include("ユーザー名を入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = '' # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it 'emailの@無しでは登録できない' do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = '' # passwordの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = '' # passwordの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00aaa'
        @user.password_confirmation = '000aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordは半角英数混合でないと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字で入力してください')
      end
      it 'passwordは半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字で入力してください')
      end
      it 'passwordは全角文字では登録できない' do
        @user.password = 'ａａａ１２３'
        @user.password_confirmation = 'ａａａ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字で入力してください')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = '' # user_nameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end
      it 'last_nameは全角漢字・ひらがな・カタカナ以外では登録できない' do
        @user.last_name = 'Yamauchi'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓は全角文字で入力してください')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（カナ）を入力してください")
      end
      it 'last_name_kanaはカタカナ以外では登録できない' do
        @user.last_name_kana = 'やまうち'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓（カナ）は全角カタカナで入力してください')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名を入力してください")
      end
      it 'first_nameは全角漢字・ひらがな・カタカナ以外では登録できない' do
        @user.first_name = 'Kazuhiro'
        @user.valid?
        expect(@user.errors.full_messages).to include('名は全角文字で入力してください')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名（カナ）を入力してください")
      end
      it 'first_name_kanaはカタカナ以外では登録できない' do
        @user.first_name_kana = 'かずひろ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名（カナ）は全角カタカナで入力してください')
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
