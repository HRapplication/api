class HolidayForm < ActiveRecord::Base
  belongs_to :employee
  enum holiday_type: [:compensation_for_overtime, :justified_paid_not, :military, :parental, 
:blood_donation, :training]
end
