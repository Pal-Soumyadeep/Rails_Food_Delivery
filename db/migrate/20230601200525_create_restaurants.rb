class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :category
      t.time :open
      t.time :close

      t.timestamps
    end
  end
end
