class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :go_to_index
  before_action :set_order

  def index
    @order_buyer = OrderBuyer.new
  end

  def create
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
      pay_item
      @order_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_buyer)
    .permit(
      :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id, :token
    )
    .merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def go_to_index
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end
