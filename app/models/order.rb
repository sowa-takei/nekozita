class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  def with_tax_price
    (order.item.price * 1.1).floor
  end

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: {
    入金待ち: 0,
    入金確認: 1,
    製作中: 2,
    発送待ち: 3,
    発送済み: 4
  }

end
