class ChangeLineItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :line_items, :created_at
    remove_column :line_items, :updated_at
  end
end
