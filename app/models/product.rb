class Product < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates :user
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999},
              format: { with: /\A[0-9]+\z/}
  end
  
  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :trading_status_id
  end
end
