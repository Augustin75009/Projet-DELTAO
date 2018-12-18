class ImplementPriceToProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :price
    add_monetize :products, :amount_cents, currency: { present: false }
  end
end
