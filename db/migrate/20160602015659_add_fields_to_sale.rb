class AddFieldsToSale < ActiveRecord::Migration
  def change
    add_column :sales, :customer_com_desc, :string
    add_column :sales, :suplier_com_desc, :string
  end
end
