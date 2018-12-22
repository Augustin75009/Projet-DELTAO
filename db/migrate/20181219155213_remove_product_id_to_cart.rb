class RemoveProductIdToCart < ActiveRecord::Migration[5.2]
  def changes
    remove_reference :carts, :products, index: true
  end
end
