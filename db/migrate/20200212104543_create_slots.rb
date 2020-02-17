class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.integer :quantity
      t.datetime :date
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
