class AddUserToTeachings < ActiveRecord::Migration[5.2]
  def change
    add_reference :teachings, :user, foreign_key: true
  end
end
