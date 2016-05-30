class ChangeClientCommission < ActiveRecord::Migration

  def change
    rename_column :sales, :client_commission, :customer_commission
  end

end
