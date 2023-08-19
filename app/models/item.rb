class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :responsibility
  belongs_to :prefecture
  belongs_to :schedule_delivery
  belongs_to :user
  has_one_attached :image
  # has_one :order

  validates :item_name, :item_text, :image, presence: true
  validates :category_id, :status_id, :responsibility_id, :prefecture_id, :schedule_delivery_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
