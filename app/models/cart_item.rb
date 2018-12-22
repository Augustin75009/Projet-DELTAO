class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  belongs_to :user

  def total
    (product.price_cents * quantity)/1000.0
  end
end
