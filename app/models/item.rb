class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  validates :item_name, :item_detail, :price, presence: true
  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end