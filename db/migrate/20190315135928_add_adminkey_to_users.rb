class AddAdminkeyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :adminkey, :string
  end
end
