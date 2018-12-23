class Purchase < ApplicationRecord
  belongs_to :user
  # ajouter une référence au panier ???
  monetize :amount_cents
end
