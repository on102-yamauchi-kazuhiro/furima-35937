class Product < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :description
    validates :condition_id
    validates :trading_status_id
    validates :category_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :user
  end
end
