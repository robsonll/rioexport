class CreateDebitNotes < ActiveRecord::Migration
  def change
    create_table :debit_notes do |t|
      t.string :bank_info
      t.float :total_ammount

      t.timestamps null: false
    end
  end
end
