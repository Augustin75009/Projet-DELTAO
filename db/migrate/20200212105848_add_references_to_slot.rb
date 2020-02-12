class AddReferencesToSlot < ActiveRecord::Migration[5.2]
  def change
    add_reference :cart_items, :slot, foreign_key: true
  end
end
