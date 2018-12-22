class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  monetize :price_cents
  has_many :cart_items, dependent: :nullify
end
