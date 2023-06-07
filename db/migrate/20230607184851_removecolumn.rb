class Removecolumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :line_items, :restaurant_id
  end
end
