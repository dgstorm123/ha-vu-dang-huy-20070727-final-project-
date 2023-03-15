class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :carplate
      t.date :date_in
      t.integer :ID
      t.time :Time
    end
  end
end
