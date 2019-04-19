class AddScheduleToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :schedule, :text
  end
end
