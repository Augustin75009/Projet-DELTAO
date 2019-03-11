class CreateTeachings < ActiveRecord::Migration[5.2]
  def change
    create_table :teachings do |t|
      t.string :title
      t.string :header
      t.text :content
      t.timestamps
    end
  end
end
