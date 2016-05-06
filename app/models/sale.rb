class Sale < ActiveRecord::Base
  belongs_to :suplier
  belongs_to :customer
end
