class TimeEntry < ActiveRecord::Base
  belongs_to :project
  belongs_to :employee
  validates :project_id, :presence => true
  validates :employee_id, :presence => true
  
  before_save :calculate_duration
  
  def calculate_duration
    self.duration = (self.end_time - self.start_time) / 60
  end
end
