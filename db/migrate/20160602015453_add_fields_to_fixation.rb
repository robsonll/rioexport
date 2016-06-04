class AddFieldsToFixation < ActiveRecord::Migration
  def change
    add_column :fixations, :customer_commission, :float
    add_column :fixations, :suplier_commission, :float
    add_column :fixations, :ptax, :float
  end
end
