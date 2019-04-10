class RemoveDateFromLesson < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :slot
    add_column :lessons, :slot, :string, array:true, defaut: []
  end
end
