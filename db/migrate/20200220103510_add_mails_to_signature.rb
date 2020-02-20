class AddMailsToSignature < ActiveRecord::Migration[5.2]
  def change
    add_column :signatures, :mail_sent, :boolean, default: false
  end
end
