class RenameSlotForCartItem < ActiveRecord::Migration[5.2]
  def change
    rename_column :lessons, :slot, :comment
  end
end
