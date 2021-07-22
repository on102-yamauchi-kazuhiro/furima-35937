class ProductsController < ApplicationController
  extend ActiveHash::Associations::ActiveRecordExtensions
  before_action :authenticate_user!, except: [:index, :show]
  before_action :product, only: [:edit, :show, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
  
  def index
    @products = Product.includes(:user).order("created_at DESC")
  end

  def new
    @product = Product.new
    @product_tag = ProductsTag.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :description, :category_id, :condition_id, :shipping_fee_id,
                                    :prefecture_id, :trading_status_id, :price, images: []).merge(user_id: current_user.id)
  end

  def product
    @product = Product.find(params[:id])
  end

  def check_user
    redirect_to root_path if current_user.id != @product.user.id || @product.order
  end
end