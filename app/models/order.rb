class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  def with_tax_price
    (order.item.price * 1.1).floor
  end

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_payment: 0,　payment_confirmation: 1, production: 2,　ready_to_ship: 3,　sent: 4 }
end
