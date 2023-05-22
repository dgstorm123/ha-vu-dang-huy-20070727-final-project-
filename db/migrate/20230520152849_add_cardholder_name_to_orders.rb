class AddCardholderNameToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :cardholder_name, :string
  end
end
