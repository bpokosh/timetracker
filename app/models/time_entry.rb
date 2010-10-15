class TimeEntry < ActiveRecord::Base
  belongs_to :project
  belongs_to :employee
  validates :project_id, :presence => true
  validates :employee_id, :presence => true
end
