class AddPriorityToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :priority, :integer, defaut: 0
  end
end
