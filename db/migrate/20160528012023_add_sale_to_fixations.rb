class AddSaleToFixations < ActiveRecord::Migration
  def change
    add_reference :fixations, :sale, index: true, foreign_key: true
  end
end
