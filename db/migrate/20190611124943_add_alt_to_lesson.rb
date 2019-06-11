class AddAltToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :alt, :string, default: "Atelier de céramique paris 18"
  end
end
