class Lesson < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  monetize :price_cents

  def total
    price_cents/1000.0
  end
end
