class RemoveProductToCart < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :carts, :products
  end
end
