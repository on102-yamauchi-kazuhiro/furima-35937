class Product < ApplicationRecord
  belongs_to :user
  has_one :order
end
