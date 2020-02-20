class Student < ApplicationRecord
  has_and_belongs_to_many :signatures
  has_many :gifts
  # belongs_to :signature, optional: true
end
