class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token
  
  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は、ハイフン（-）を含めて入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は、１０桁または１１桁で入力してください' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,
                   phone_number: phone_number, order_id: order.id)
  end
end
