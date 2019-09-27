class ChangePriorityToEvent < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :priority, :integer, default: 1
  end
end
