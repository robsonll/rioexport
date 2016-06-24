class AddFieldsToDebitNote < ActiveRecord::Migration
  def change
    #add_column :debit_notes, :customer_id, :integer
    add_reference :debit_notes, :customer, index: true, foreign_key: true
  end
end
