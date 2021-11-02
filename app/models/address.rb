class Address < ApplicationRecord

 validates :postal_code, presence: true

  belongs_to :customer
end
