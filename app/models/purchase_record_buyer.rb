class PurchaseRecordBuyer
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipality, :address, :building, :phone_number, :purchase_record_id, :item_id, :user_id
  with_options presence: true do
    validates :purchase_record_id
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: 'is invalid.input only number'}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  
  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)

    Buyer.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, address: address, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end