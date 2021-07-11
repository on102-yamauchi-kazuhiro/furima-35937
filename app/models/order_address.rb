class OrderAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :prefecture, :city, :address, :building_name, :phone_number, :token
  
  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{1,11}\z/, message: 'is invalid. Please enter in 11-letter numbers.' }
    validates :token
  end
end
