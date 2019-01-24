class AddColumnToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :adult, :boolean
    add_column :lessons, :child, :boolean
    add_column :lessons, :phone_booking, :boolean
    add_column :lessons, :payable, :boolean
    add_column :lessons, :online_booking, :boolean
    add_column :lessons, :gift_card, :boolean
  end
end
