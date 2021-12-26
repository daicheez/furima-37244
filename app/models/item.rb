class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase_record
  has_one_attached :image

  validates :item_name, :item_detail, :image, presence: true
  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price,
            presence: true,
            numericality: {
              only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999
            }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_fee, :prefecture, :shipping_day
end
