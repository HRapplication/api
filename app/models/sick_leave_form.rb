class SickLeaveForm < ActiveRecord::Base
  belongs_to :employee

  validates_presence_of :start_date, :end_date, :care_type, :employee_id
end
