class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :products
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
    @product = product.find(params[:product_id])
  end

  def check_user
    redirect_to root_path if current_user.id == @item.user.id || @product.order
  end

  def order_params
    params.require(:order_address).permit(:zip, :prefecture, :city, :address_line1, :address_line2,
                                          :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
end
