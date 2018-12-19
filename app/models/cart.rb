class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  monetize :price_cents
  has_many :cart_items
end
