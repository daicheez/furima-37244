class OrdersController < ApplicationController
  def index
    @item = Item.find_by(id: params[:item_id])
    @purchase_record_buyer = PurchaseRecordBuyer.new
  end

  def create
  end
end
