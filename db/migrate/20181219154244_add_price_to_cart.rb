class AddPriceToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :price_cents, :integer
  end
end
