class AddDescriptionToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :card_description, :text
  end
end
