class ProductTagRelation < ApplicationRecord
  belongs_to :product
  belongs_to :tag
end