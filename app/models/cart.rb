class Cart < ApplicationRecord
  belongs_to :user
  monetize :price_cents
  has_many :cart_items, dependent: :destroy

  def total
    cart_items.to_a.sum(&:total)
  end
end
