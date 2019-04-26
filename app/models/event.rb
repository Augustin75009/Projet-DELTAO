class Event < ApplicationRecord
  # belongs_to :user, optional: true
  mount_uploader :photo, PhotoUploader

  validates :start_date, presence: true
  validates :end_date, presence: true
end
