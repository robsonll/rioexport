class AddFieldsToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :complete_name, :string
  end
end
