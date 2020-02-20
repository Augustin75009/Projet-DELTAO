class AddReferenceToGift < ActiveRecord::Migration[5.2]
  def change
    add_reference :gifts, :student, foreign_key: true
  end
end
