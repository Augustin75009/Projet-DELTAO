class Signature < ApplicationRecord
  has_and_belongs_to_many :students
  # belongs_to :student, optional: :true
end
