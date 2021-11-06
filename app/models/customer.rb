class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

    validates :email, presence: true
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :last_name_kana, presence: true
    validates :first_name_kana, presence: true
    validates :email, presence: true
    validates :telephone_number, presence: true
    validates :postal_code, presence: true
    validates :address, presence: true



    has_many :cart_items
    has_many :orders
    has_many :addresses
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :reviews, dependent: :destroy



  def active_for_authentication?
    super && (self.is_active == true)
  end
end
