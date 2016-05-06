class Removedecimalfromsales < ActiveRecord::Migration
  def change
    remove_column :sales, :decimal, :string
  end
end
