class DebitNote < ActiveRecord::Base
  has_many :fixations    
  has_many :sales, :through => :fixations
end
