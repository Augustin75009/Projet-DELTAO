class JoinfTables < ActiveRecord::Migration[5.2]
  def change
    create_table :signatures_students, id: false do |t|
      t.integer :signature_id
      t.integer :student_id
    end

    remove_reference :students, :signature
    remove_reference :signatures, :student
  end
end
