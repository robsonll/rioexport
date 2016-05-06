class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :rioexport_contract
      t.string :suplier_contract
      t.string :customer_contract
      t.string :shipping_company
      t.integer :bags_qty
      t.date :shipping_date
      t.decimal :price
      t.string :product_type
      t.string :comission_value
      t.string :decimal
      t.references :suplier, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
