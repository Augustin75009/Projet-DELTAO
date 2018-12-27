class Lesson < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  monetize :price_cents
  has_many :cart_items, dependent: :nullify

  def total
    price_cents/1000.0
  end
end
