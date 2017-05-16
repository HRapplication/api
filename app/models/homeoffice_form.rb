class HomeofficeForm < ActiveRecord::Base
  belongs_to :employee

  validates_presence_of :start_date, :end_date, :employee_id
end
