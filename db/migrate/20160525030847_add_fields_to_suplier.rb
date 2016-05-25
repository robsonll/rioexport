class AddFieldsToSuplier < ActiveRecord::Migration
  def change
    add_column :supliers, :complete_name, :string
    add_column :supliers, :cnpj, :string
    add_column :supliers, :inscr_est, :string
  end
end
