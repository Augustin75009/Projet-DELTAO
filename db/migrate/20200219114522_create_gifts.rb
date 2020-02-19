class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.string :state
      t.string :product_sku
      t.string :gift_to
      t.string :gift_from
      t.jsonb :payment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
