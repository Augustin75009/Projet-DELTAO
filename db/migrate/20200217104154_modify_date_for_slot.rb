class ModifyDateForSlot < ActiveRecord::Migration[5.2]
  def change
    remove_column :slots, :date
    add_column :slots, :date, :date
  end
end
