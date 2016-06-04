class RemoveFieldsFromSale < ActiveRecord::Migration
  def change
    remove_column :sales, :customer_commission, :string
    remove_column :sales, :suplier_commission, :string
  end
end
