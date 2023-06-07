class AddReferenceToLineItems < ActiveRecord::Migration[6.0]
  def change
    change_table :line_items do |t|
      t.integer :restaurant_id
    end
    add_foreign_key :line_items, :restaurants
    add_foreign_key :line_items, :menus
    add_foreign_key :line_items, :carts
    add_foreign_key :line_items, :orders
  end
end
