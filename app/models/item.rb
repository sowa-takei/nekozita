class Item < ApplicationRecord
  attachment :image

  belongs_to :genre

  has_many :cart_items, dependent: :destroy
  has_many :order_details
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  def with_tax_price
    (price * 1.1).floor
  end
end
