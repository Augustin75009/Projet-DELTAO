class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.integer :quantity
      t.date :slot
      t.string :photo
      t.monetize :price, currency: { present: false }

      t.timestamps
    end
  end
end
