class AddBankNameToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :bank_name, :string
  end
end
