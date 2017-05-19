class HolidayForm < ActiveRecord::Base
  belongs_to :employee
  enum holiday_type: [:compensation_for_overtime, :justified_paid_not, :military, :parental, 
:blood_donation, :training]

  validates_presence_of :start_date, :end_date, :holiday_type, :comment, :employee_id
end
