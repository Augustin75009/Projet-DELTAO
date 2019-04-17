class AddColumnToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :adult, :boolean, :default => false
    add_column :lessons, :child, :boolean, :default => false
    add_column :lessons, :phone_booking, :boolean, :default => false
    add_column :lessons, :payable, :boolean, :default => false
    add_column :lessons, :online_booking, :boolean, :default => false
    add_column :lessons, :gift_card, :boolean, :default => false
  end
end
