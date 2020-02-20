class AddPhotoToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :photo_1, :string
    add_column :lessons, :photo_2, :string
  end
end
