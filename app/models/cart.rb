class Cart < ApplicationRecord
  belongs_to :user
  monetize :price_cents
  has_many :cart_items, dependent: :destroy

  def total
    cart_items.to_a.sum(&:total)
  end

   def add_product(product)
    item = CartItem.find_by(product: product)
    if item
      item.quantity += 1
    else
      item = CartItem.new(product: product)
    end
    item
  end

  def add_lesson(lesson)
    item = CartItem.find_by(lesson: lesson)
    if item
      item.quantity += 1
    else
      item = CartItem.new(lesson: lesson)
    end
    item
  end
end
