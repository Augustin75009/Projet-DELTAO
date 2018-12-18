class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :state
      t.string :teddy_sku
      t.monetize :amount, currency: { present: false }
      t.jsonb :payment
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
