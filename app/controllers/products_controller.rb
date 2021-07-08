class ProductsController < ApplicationController
  extend ActiveHash::Associations::ActiveRecordExtensions
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:edit, :show]
  
  def index
    @products = Product.includes(:user).order("created_at DESC")
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

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :image, :description, :category_id, :condition_id, :shipping_fee_id,
                                    :prefecture_id, :trading_status_id, :price).merge(user_id: current_user.id)
  end

  # def edit
  #   @product = Product.find(params[:id])
  # end

  # def destroy
  #   product = Product.find(params[:id])
  #   product.destroy
  # end

  def set_product
    @product = Product.find(params[:id])
  end
end