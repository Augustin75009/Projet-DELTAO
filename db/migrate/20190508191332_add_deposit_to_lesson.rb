class AddDepositToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :deposit, :integer
    remove_column :lessons, :online_booking
  end
end
