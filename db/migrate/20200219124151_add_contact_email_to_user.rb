class AddContactEmailToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :contact_email, :string
  end
end
