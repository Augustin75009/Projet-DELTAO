class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  monetize :price_cents
  has_many :cart_items, dependent: :nullify

  include PgSearch
  pg_search_scope :search_by_name_and_category,
    against: [ :name, :category ],
    using: {
      tsearch: { prefix: true }
    }

  def total
    price_cents/1000.0
  end
end
