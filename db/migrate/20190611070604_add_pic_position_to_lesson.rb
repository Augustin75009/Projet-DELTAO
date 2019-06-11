class AddPicPositionToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :pic_position, :string, default: "center"
  end
end
