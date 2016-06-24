class Customer < ActiveRecord::Base
  has_many :sales
  has_many :supliers, :through => :sales
  has_many :debit_notes
  
  validates :name, :complete_name, presence: true
end
