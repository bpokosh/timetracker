# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
require 'csv'
Customer.destroy_all
CSV.foreach("db/customers.csv", headers: true) do |data|
  customer = Customer.new
  customer.company = data['Company']
  customer.address1 = data['Address1']
  customer.address2 = data['Address2']
  customer.address3 = data['Address3']
  customer.city = data['City']
  customer.state = data['State']
  customer.zip = data['Zip']
  customer.phone1 = data['Phone1']
  customer.phone2 = data['Phone2']
  customer.fax1 = data['Fax1']
  customer.fax2 = data['Fax2']
  customer.email = data['Email']
  customer.website = data['Website']
  customer.save
end