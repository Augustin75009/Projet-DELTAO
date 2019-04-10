class RemoveSlotFromLesson < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :slot
    add_column :lessons, :slot, :date, array:true, defaut: []
  end
end
