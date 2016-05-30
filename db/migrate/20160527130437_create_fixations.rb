class CreateFixations < ActiveRecord::Migration
  def change
    create_table :fixations do |t|
      t.string :fixed_lot
      t.string :average_price
      t.string :defferential
      t.string :final_price

      t.timestamps null: false
    end
  end
end
