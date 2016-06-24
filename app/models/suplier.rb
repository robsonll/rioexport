class Suplier < ActiveRecord::Base
  has_many :orders
  has_many :customers, :through => :orders
  
  validates :name, :complete_name, presence: true
end
