class AddSlotToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :slot, :string, array:true, defaut: []
  end
end
