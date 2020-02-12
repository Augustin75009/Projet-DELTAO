class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product, optional: true
  belongs_to :lesson, optional: true
  belongs_to :slot, optional: true
  belongs_to :user
  validates :slot, presence: true

  def total
    if product
      (product.price_cents * quantity) / 1000
    else
      (lesson.price_cents * quantity) / 1000
    end
  end
end
