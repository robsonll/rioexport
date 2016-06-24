class DebitNote < ActiveRecord::Base
  belongs_to :customer
  has_many :fixations    
  has_many :sales, :through => :fixations

  accepts_nested_attributes_for :fixations, :sales
  validates :customer_id, presence: true
end
