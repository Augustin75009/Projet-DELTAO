class AddReferenceToSignature < ActiveRecord::Migration[5.2]
  def change
    add_reference :signatures, :student, foreign_key: true
  end
end
