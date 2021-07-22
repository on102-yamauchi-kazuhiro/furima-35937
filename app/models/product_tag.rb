class ProductsTag
  include ActiveModel::Model
  attr_accessor :tag_name, :product_name, :price, :description, :image, :condition_id,
                :shipping_fee_id, :prefecture_id, :trading_status_id, :user_id
  
  with_options presence: true do
    validates :product_name
    validates :tag_name
  end
  
  def save
    product = Product.create
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    ProductTagRelation.create(product_id: product.id, tag_id: tag.id)
  end
end