class Lesson < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  monetize :price_cents
  has_many :cart_items, dependent: :nullify
  belongs_to :user

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
