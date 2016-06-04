class AddDebitNoteToFixations < ActiveRecord::Migration
  def change
    add_reference :fixations, :debit_note, index: true, foreign_key: true
  end
end
