class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :company
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone1
      t.string :phone2
      t.string :fax1
      t.string :fax2
      t.string :email
      t.string :website

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
