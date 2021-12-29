class OrdersController < ApplicationController
  def index
    @purchase_record_buyer = PurchaseRecordBuyer.new
  end

  def create
  end
end
