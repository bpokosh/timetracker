class AddCompletedAtToTimeEntries < ActiveRecord::Migration
  def self.up
    add_column :time_entries, :completed_at, :datetime
  end

  def self.down
    remove_column :time_entries, :completed_at
  end
end
