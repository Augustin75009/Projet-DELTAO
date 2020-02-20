class Lesson < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  mount_uploader :photo_1, PhotoUploader
  mount_uploader :photo_2, PhotoUploader
  monetize :price_cents
  has_many :cart_items, dependent: :nullify
  has_many :slots, dependent: :destroy
  belongs_to :user, optional: true

  # validates :slot, presence: true

  include PgSearch
  pg_search_scope :search_by_category,
    against: [:category],
    using: {
      tsearch: { prefix: true }
    }

  def total
    price_cents / 1000.0
  end
end
