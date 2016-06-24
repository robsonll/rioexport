class Sale < ActiveRecord::Base
  belongs_to :suplier
  belongs_to :customer
  has_one :shipping, autosave:true
  has_one :fixation, autosave:true
  
  accepts_nested_attributes_for :shipping, :fixation
  validates :rioexport_contract, :customer_id, :suplier_id, presence: true
end
