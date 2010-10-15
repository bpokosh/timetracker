class SetDefaultDurationForTimeEntries < ActiveRecord::Migration
  def self.up
    change_column :time_entries, :duration, :integer, :default => 0
  end

  def self.down
    change_column :time_entries, :duration, :integer
  end
end
