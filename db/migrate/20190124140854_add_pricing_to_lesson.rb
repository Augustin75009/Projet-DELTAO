class AddPricingToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :pricing, :text
  end
end
