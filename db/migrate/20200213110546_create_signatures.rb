class CreateSignatures < ActiveRecord::Migration[5.2]
  def change
    create_table :signatures do |t|
      t.datetime :date
      t.string :title

      t.timestamps
    end
  end
end
