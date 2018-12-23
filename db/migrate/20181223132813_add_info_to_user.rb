class AddInfoToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :text
    add_column :users, :city, :string
    add_column :users, :zip, :integer
    add_column :users, :phone, :integer
  end
end
