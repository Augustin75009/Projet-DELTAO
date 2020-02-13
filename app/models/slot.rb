class Slot < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items
end
