class AddReferencesToStudent < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :signature, foreign_key: true
  end
end
