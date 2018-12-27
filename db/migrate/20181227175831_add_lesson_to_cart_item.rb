class AddLessonToCartItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :cart_items, :lesson, foreign_key: true
  end
end
