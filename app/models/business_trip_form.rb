class BusinessTripForm < ActiveRecord::Base
  belongs_to :employee
  
  validates_presence_of :start_date, :end_date, :company, :transport, :employee_id
end
