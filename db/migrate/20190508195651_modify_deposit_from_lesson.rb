class ModifyDepositFromLesson < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :deposit
    add_column :lessons, :deposit, :integer, default: 0, null: false
  end
end
