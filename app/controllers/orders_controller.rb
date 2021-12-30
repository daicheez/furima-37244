class OrdersController < ApplicationController
  before_action :set_order

  def index
    @order_buyer = OrderBuyer.new
  end

  def create
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
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
      :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id
    )
    .merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
