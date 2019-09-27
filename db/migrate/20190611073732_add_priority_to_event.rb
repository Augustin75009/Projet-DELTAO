class AddPriorityToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :priority, :integer, default: 0
  end
end
