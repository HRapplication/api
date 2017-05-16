class Schedule < ActiveRecord::Base
  belongs_to :employee

  validates_presence_of :work_date, :start_hour, :end_gour, :is_weekend, :employee_id
end
