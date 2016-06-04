class Fixation < ActiveRecord::Base
    belongs_to :sale
    belongs_to :debit_note
end
