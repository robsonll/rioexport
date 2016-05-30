class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
      t.string :destination
      t.string :shipping_line
      t.string :daparture_terminal
      t.string :arriving_terminal
      t.string :special_conditions
      t.string :documents

      t.timestamps null: false
    end
  end
end
