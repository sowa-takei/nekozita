class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  validates :amount, inclusion: { in: (1..10) }

  def subtotal
    item.with_tax_price * amount
  end
end


