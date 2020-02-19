class Gift < ApplicationRecord
  belongs_to :user
  monetize :amount_cents

  def total
    gift.amount_cents
  end
end
