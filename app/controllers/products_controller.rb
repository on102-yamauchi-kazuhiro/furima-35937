class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @products = Product.includes(:user)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :image, :description, :category_id, :condition_id, :shipping_fee_id,
                                    :prefecture_id, :trading_status_id, :price).merge(user_id: current_user.id)
  end
end
