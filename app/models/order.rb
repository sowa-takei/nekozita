class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  def with_tax_price
    (order.item.price * 1.1).floor
  end

  enum payment_method: { credit_card: 0, transfer: 1 }

end
