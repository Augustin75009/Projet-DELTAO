class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product, optional: true
  belongs_to :lesson, optional: true
  belongs_to :user
  validates :slot, presence: true

  def total
    if product
      (product.deposit * quantity)
    else
      (lesson.deposit * quantity)
    end
  end
end
