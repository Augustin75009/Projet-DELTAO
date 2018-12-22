class AddAmountToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_monetize :purchases, :amount, currency: { present: false }
  end
end
