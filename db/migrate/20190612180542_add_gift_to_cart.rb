class AddGiftToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :gift, :string, default: ""
  end
end
