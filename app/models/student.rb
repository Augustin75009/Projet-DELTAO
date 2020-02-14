class Student < ApplicationRecord
  belongs_to :signature, optional: true
  has_many :signatures, dependent: :nullify
end
