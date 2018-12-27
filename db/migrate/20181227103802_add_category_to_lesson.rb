class AddCategoryToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :category, :string
  end
end
