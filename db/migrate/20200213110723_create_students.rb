class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :city
      t.integer :zip
      t.integer :phone

      t.timestamps
    end
  end
end
