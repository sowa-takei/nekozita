class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :cart_items
    has_many :orders
    has_many :addresses
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

  def active_for_authentication?
    super && (self.is_active == true)
  end
end
