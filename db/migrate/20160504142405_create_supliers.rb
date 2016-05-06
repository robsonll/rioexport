class CreateSupliers < ActiveRecord::Migration
  def change
    create_table :supliers do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :state
      t.string :country

      t.timestamps null: false
    end
  end
end
