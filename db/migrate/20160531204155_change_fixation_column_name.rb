class ChangeFixationColumnName < ActiveRecord::Migration
  def change
    rename_column :fixations, :defferential, :diferential
  end
end
