class Gift < ApplicationRecord
  belongs_to :user
  belongs_to :student, optional: true
  has_many :purchases
  monetize :amount_cents

  def total
    gift.amount_cents
  end
end
