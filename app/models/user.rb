class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  
  has_many :products
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      user_name: auth.info.name,
      email: auth.info.email
    )
    # userが登録済みであるか判断
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  with_options presence: true do
    validates :user_name
    validates :birth_date
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字で入力してください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヴー]+\z/u, message: 'は全角カタカナで入力してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)\w{6,}\z/i
  with_options presence: true,
               format: { with: VALID_PASSWORD_REGEX,
                         message: 'は半角英数字で入力してください' } do
    validates :password
  end
end
