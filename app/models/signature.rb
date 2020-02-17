class Signature < ApplicationRecord
  has_many :students, dependent: :nullify
  belongs_to :student, optional: :true
end
