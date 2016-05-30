class AddFieldsToSales < ActiveRecord::Migration
  def change
    add_column :sales, :shipping_co_id, :integer
    add_column :sales, :shipping_date, :string
    add_column :sales, :price, :string
    add_column :sales, :payment_type, :string
    add_column :sales, :client_commission, :string
    add_column :sales, :suplier_commission, :string
  end
end
