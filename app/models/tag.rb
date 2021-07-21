class Tag < ApplicationRecord
  has_many :product_tag_relations
  has_many :products, through: :product_tag_relations
end
