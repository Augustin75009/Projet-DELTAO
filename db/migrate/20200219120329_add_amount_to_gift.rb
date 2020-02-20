class AddAmountToGift < ActiveRecord::Migration[5.2]
  def change
    add_column :gifts, :amount_cents, :integer, default: 0, null: false
  end
end
