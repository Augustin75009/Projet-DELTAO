class AddAltToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :alt, :string, default: "Atelier de céramique paris 18"
  end
end
