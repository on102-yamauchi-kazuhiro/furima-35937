class ProductTagRelation < ApplicationRecord
  belongs_to :product_name
  belongs_to :tag
end