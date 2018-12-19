class RemoveIndexToCart < ActiveRecord::Migration[5.2]
  def change
    remove_index :carts, column: :product_id
  end
end
