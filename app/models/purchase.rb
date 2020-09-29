class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :gift, optional: true
  # ajouter une référence au panier ???
  monetize :amount_cents

  def total
    purchase.amount_cents
  end
end
