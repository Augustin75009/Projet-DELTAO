class Slot < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :lesson, optional: true
  has_many :cart_items, dependent: :destroy
end
