class Cart < ApplicationRecord
  belongs_to :user
  monetize :price_cents
  has_many :cart_items
end
