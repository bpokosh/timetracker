class Customer < ActiveRecord::Base
  has_many :projects, :dependent => :destroy
  has_many :time_entries, :through => :projects
end
