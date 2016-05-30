class AddSaleToShippings < ActiveRecord::Migration
  def change
    add_reference :shippings, :sale, index: true, foreign_key: true
  end
end
