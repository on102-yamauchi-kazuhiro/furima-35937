class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :card_number
  
  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{1,11}\z/, message: 'is invalid. Please enter 11-digit number.' }
  end

  def save
    # 寄付情報を保存し、変数orderに代入する
    order = Order.create(user_id: user_id, product_id: product_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,
                   phone_number: phone_number, order_id: order.id)
  end
end
