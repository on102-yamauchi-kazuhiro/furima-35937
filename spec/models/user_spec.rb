require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'user_nameが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.user_name = ''  # user_nameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("User name can't be blank")
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = ''  # emailの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
