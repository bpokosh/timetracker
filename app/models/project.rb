class Project < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => {:scope => :customer_id}
  validates :customer_id, :presence => true
  belongs_to :customer
end
