class Student < ApplicationRecord
  # belongs_to :signature, optional: true
  has_and_belongs_to_many :signatures
end
