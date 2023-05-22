class AddTitleToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :title, :string
  end
end
