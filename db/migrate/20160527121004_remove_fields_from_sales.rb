class RemoveFieldsFromSales < ActiveRecord::Migration
  def change
    remove_column :sales, :price, :decimal
    remove_column :sales, :decimal, :string
    remove_column :sales, :shipping_company, :string
    remove_column :sales, :shipping_date, :date
    remove_column :sales, :comission_value, :string
  end
end
