class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :product
  before_action :check_user

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_product
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def product
    @product = Product.find(params[:product_id])
  end

  def check_user
    redirect_to root_path if current_user.id == @product.user.id
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :address, :building_name,
                                          :phone_number).merge(user_id: current_user.id, product_id: @product.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
