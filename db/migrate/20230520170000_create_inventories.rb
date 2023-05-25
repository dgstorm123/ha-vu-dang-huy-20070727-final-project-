class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :name
      t.integer :quantity
      t.date :import_day
      t.date :exp_day
      t.integer :day_left
      t.string :provider

      t.timestamps
    end
  end
end
