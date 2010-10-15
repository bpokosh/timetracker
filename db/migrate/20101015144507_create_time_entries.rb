class CreateTimeEntries < ActiveRecord::Migration
  def self.up
    create_table :time_entries do |t|
      t.integer :duration
      t.text :description
      t.belongs_to :project, :employee
      t.timestamps
    end
  end

  def self.down
    drop_table :time_entries
  end
end
