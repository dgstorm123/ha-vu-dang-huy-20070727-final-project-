class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.datetime :date
      t.string :carplate
    end
  end
end
