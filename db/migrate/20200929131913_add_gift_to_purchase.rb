class AddGiftToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_reference :purchases, :gift, foreign_key: true
  end
end
